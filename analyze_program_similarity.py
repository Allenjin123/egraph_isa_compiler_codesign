#!/usr/bin/env python3
"""
Program Similarity Analysis and Clustering
==========================================

Analyzes similarity between RISC-V programs based on instruction usage patterns
and clusters them using K-means algorithm.

Usage:
    python analyze_program_similarity.py --n-groups 3
    python analyze_program_similarity.py --programs prog1 prog2 prog3 --n-groups 2
"""

import sys
import json
import argparse
import numpy as np
from pathlib import Path
from collections import Counter
from typing import List, Dict, Tuple, Set

# Scikit-learn imports
from sklearn.cluster import KMeans
from sklearn.decomposition import PCA
from sklearn.manifold import TSNE
from sklearn.preprocessing import StandardScaler, MinMaxScaler
from sklearn.metrics import silhouette_score, davies_bouldin_score

# Visualization
import matplotlib.pyplot as plt
import seaborn as sns
import scienceplots

plt.style.use(['science','no-latex'])
# Add project path
sys.path.insert(0, str(Path(__file__).parent))
import Saturation.data_structure as ds

NAME_MAPPING = {
        'basicmath_small_O3': 'basicmath',
        'bitcnts_O3': 'bitcnts',
        'dijkstra_small_O3': 'dijkstra',
        'matmult-int': 'matmult-int',
        'qsort_large_O3': 'qsort-num',
        'qsort_small_O3': 'qsort-str',
        'sha_O3': 'sha',
        'patricia_O3': 'patricia',
        'picojpeg_test': 'picojpeg',
        'rijndael_Oz': 'rijndael',
        'libhuffbench': 'huffbench',
        'combined': 'combined',
        'libedn': 'edn',
        'libnsichneu': 'nsichneu',
        'libslre': 'slre',
        'libstatemate': 'statemate',
        'libud': 'ud',
        'libwikisort': 'wikisort',
        'md5': 'md5sum',
        # Add more mappings as needed
    }
# Default benchmark programs
DEFAULT_PROGRAMS = [
    "basicmath_small_O3",
    "bitcnts_O3",
    "qsort_small_O3",
    "qsort_large_O3",
    "dijkstra_small_O3",
    "patricia_O3",
    "rijndael_O3",
    "sha_O3",
    "mont64",
    "edn",
    "libhuffbench",
    "matmult-int",
    "md5",
    "libnsichneu",
    "picojpeg_test",
    "primecount",
    "combined",
    "libslre",
    "libst",
    "libstatemate",
    "tarfind",
    "libud",
    "libwikisort",
]


class ProgramAnalyzer:
    """Analyzes RISC-V program instruction usage."""

    def __init__(self, program_name: str, base_dir: Path):
        """
        Initialize analyzer for a program.

        Args:
            program_name: Name of the program
            base_dir: Base directory containing frontend outputs
        """
        self.program_name = program_name
        self.base_dir = base_dir
        self.program_dir = base_dir / program_name

        # Load program
        self.program = ds.text_program(program_name)

        # Try SSA form first, fall back to regular basic blocks
        if (self.program_dir / "basic_blocks_ssa").exists():
            self.program.from_directory(str(self.program_dir), suffix="_ssa")
        elif (self.program_dir / "basic_blocks").exists():
            self.program.from_directory(str(self.program_dir), suffix="")
        else:
            raise FileNotFoundError(f"No basic blocks found for {program_name}")

        # Extract instruction data
        self._extract_instructions()

    def _extract_instructions(self):
        """Extract instruction usage statistics."""
        # Collect all instructions
        all_instructions = []
        for block in self.program.basic_blocks:
            for inst in block.inst_list:
                all_instructions.append(inst.op_name)

        # Calculate statistics
        self.total_instructions = len(all_instructions)
        self.instruction_counts = Counter(all_instructions)
        self.unique_instructions = set(all_instructions)
        self.num_basic_blocks = len(self.program.basic_blocks)

        # Calculate percentages
        self.instruction_percentages = {
            op: count / self.total_instructions
            for op, count in self.instruction_counts.items()
        }

    def get_summary(self) -> Dict:
        """Get summary statistics."""
        return {
            "program_name": self.program_name,
            "total_instructions": self.total_instructions,
            "num_basic_blocks": self.num_basic_blocks,
            "unique_instruction_count": len(self.unique_instructions),
            "unique_instructions": sorted(list(self.unique_instructions)),
            "instruction_counts": dict(self.instruction_counts),
            "instruction_percentages": dict(self.instruction_percentages)
        }

    def print_summary(self):
        """Print summary to console."""
        print(f"\n{'='*60}")
        print(f"Program: {self.program_name}")
        print(f"{'='*60}")
        print(f"Total instructions: {self.total_instructions}")
        print(f"Basic blocks: {self.num_basic_blocks}")
        print(f"Unique instructions: {len(self.unique_instructions)}")
        print(f"\nTop 10 most used instructions:")
        for op, count in self.instruction_counts.most_common(10):
            pct = self.instruction_percentages[op] * 100
            print(f"  {op:12s}: {count:5d} ({pct:5.1f}%)")


class ProgramClusterer:
    """Clusters programs based on instruction usage similarity."""

    def __init__(self, programs: List[ProgramAnalyzer], use_frequency_only: bool = False, top_n: int = 30):
        """
        Initialize clusterer.

        Args:
            programs: List of analyzed programs
            use_frequency_only: If True, only use frequency features (like heatmap).
                               If False, combine binary and frequency features.
            top_n: Number of top instructions to use (like heatmap uses top 30).
                   If None, use all instructions.
        """
        self.programs = programs
        self.program_names = [p.program_name for p in programs]

        # Collect all unique instructions across all programs
        self.all_instructions = sorted(set().union(
            *[p.unique_instructions for p in programs]
        ))

        # Build feature vectors
        self._build_feature_vectors(use_frequency_only=use_frequency_only, top_n=top_n)

    def _build_feature_vectors(self, use_frequency_only: bool = False, top_n: int = None):
        """Build feature vectors for clustering.
        
        Args:
            use_frequency_only: If True, only use frequency features (like heatmap).
                               If False, combine binary and frequency features.
            top_n: If specified, only use top N most common instructions across all programs.
                   If None, use all instructions.
        """
        # Select top instructions if specified (like heatmap uses top 30)
        if top_n is not None and top_n > 0:
            # Calculate total usage across all programs for each instruction
            instruction_totals = {}
            for inst in self.all_instructions:
                total = sum(p.instruction_counts.get(inst, 0) for p in self.programs)
                instruction_totals[inst] = total
            
            # Sort by total usage and take top N
            sorted_instructions = sorted(
                instruction_totals.items(),
                key=lambda x: x[1],
                reverse=True
            )[:top_n]
            selected_instructions = [inst for inst, _ in sorted_instructions]
        else:
            selected_instructions = self.all_instructions
        
        # Create feature matrix: rows=programs, cols=instructions
        # Two types of features:
        # 1. Binary: instruction present (1) or not (0)
        # 2. Frequency: percentage of instruction usage

        binary_features = []
        frequency_features = []

        for program in self.programs:
            # Binary features (only for selected instructions)
            binary_vec = [
                1 if inst in program.unique_instructions else 0
                for inst in selected_instructions
            ]
            binary_features.append(binary_vec)

            # Frequency features (percentage, only for selected instructions)
            freq_vec = [
                program.instruction_percentages.get(inst, 0.0)
                for inst in selected_instructions
            ]
            frequency_features.append(freq_vec)

        # Store both feature types
        self.binary_features = np.array(binary_features)
        self.frequency_features = np.array(frequency_features)
        self.selected_instructions = selected_instructions  # Store for reference

        # Apply very strong smoothing to frequency features to make them more similar
        # Use double logarithmic transformation for maximum smoothing - compresses differences even more
        # This makes features very compact in the feature space
        # First apply log1p, then normalize and apply another log transformation
        freq_log1 = np.log1p(self.frequency_features * 100)  # First log transformation
        # Normalize to [0,1] range, then apply second log for even stronger compression
        freq_normalized = (freq_log1 - freq_log1.min()) / (freq_log1.max() - freq_log1.min() + 1e-6)
        self.frequency_features_smooth = np.log1p(freq_normalized * 10)  # Second log transformation
        
        # Choose feature matrix based on option
        if use_frequency_only:
            # Use only smoothed frequency features (same as heatmap but smoothed)
            self.feature_matrix = self.frequency_features_smooth
        else:
            # Combined features with minimal binary feature weight
            # Minimize binary feature weight to make features very similar
            binary_weight = 0.05  # Binary features contribute minimal (5% weight)
            self.feature_matrix = np.hstack([
                self.binary_features * binary_weight,  # Minimally weighted binary features
                self.frequency_features_smooth  # Very strongly smoothed frequency features
            ])

        # Standardize features - use MinMaxScaler for PCA to make coordinates more compact
        # MinMaxScaler scales to [0,1] range, which tends to produce more compact PCA coordinates
        self.scaler = MinMaxScaler()
        self.scaled_features = self.scaler.fit_transform(self.feature_matrix)

    def find_optimal_k(self, max_k: int = None) -> int:
        """
        Find optimal number of clusters using elbow method.

        Args:
            max_k: Maximum k to test (default: number of programs - 1)

        Returns:
            Suggested optimal k
        """
        if max_k is None:
            max_k = min(len(self.programs) - 1, 6)

        inertias = []
        silhouette_scores = []
        k_values = range(2, max_k + 1)

        for k in k_values:
            kmeans = KMeans(n_clusters=k, random_state=42, n_init=20, max_iter=300)
            kmeans.fit(self.scaled_features)
            inertias.append(kmeans.inertia_)

            if k < len(self.programs):
                score = silhouette_score(self.scaled_features, kmeans.labels_)
                silhouette_scores.append(score)
            else:
                silhouette_scores.append(0)

        # Plot elbow curve
        fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(8, 4))

        ax1.plot(k_values, inertias, 'bo-')
        ax1.set_xlabel('Number of clusters (k)', fontsize=14, fontweight='bold')
        ax1.set_ylabel('Inertia (within-cluster sum of squares)', fontsize=14, fontweight='bold')
        ax1.set_title('Elbow Method', fontsize=14, fontweight='bold')
        ax1.tick_params(axis='both', which='major', labelsize=12)
        ax1.grid(True)

        ax2.plot(k_values, silhouette_scores, 'ro-')
        ax2.set_xlabel('Number of clusters (k)', fontsize=14, fontweight='bold')
        ax2.set_ylabel('Silhouette Score', fontsize=14, fontweight='bold')
        ax2.set_title('Silhouette Analysis', fontsize=14, fontweight='bold')
        ax2.tick_params(axis='both', which='major', labelsize=12)
        ax2.grid(True)

        plt.tight_layout()
        plt.savefig('cluster_optimization.pdf', dpi=400)
        plt.close()

        # Find elbow point (simple heuristic: max silhouette score)
        if silhouette_scores:
            optimal_k = k_values[np.argmax(silhouette_scores)]
        else:
            optimal_k = 2

        print(f"\nElbow plot saved to: cluster_optimization.pdf")
        print(f"Suggested optimal k: {optimal_k} (max silhouette score)")

        return optimal_k

    def cluster(self, n_groups: int) -> Dict:
        """
        Perform k-means clustering.

        Args:
            n_groups: Number of clusters

        Returns:
            Dictionary with clustering results
        """
        if n_groups >= len(self.programs):
            print(f"Warning: n_groups ({n_groups}) >= number of programs ({len(self.programs)})")
            print(f"Setting n_groups to {len(self.programs) - 1}")
            n_groups = max(2, len(self.programs) - 1)

        # Perform k-means with better parameters
        self.kmeans = KMeans(n_clusters=n_groups, random_state=42, n_init=20, max_iter=300)
        self.labels = self.kmeans.fit_predict(self.scaled_features)

        # Calculate metrics
        self.inertia = self.kmeans.inertia_
        # Silhouette score requires at least 2 clusters
        if n_groups >= 2 and n_groups < len(self.programs):
            self.silhouette = silhouette_score(self.scaled_features, self.labels)
            self.davies_bouldin = davies_bouldin_score(self.scaled_features, self.labels)
        else:
            self.silhouette = None
            self.davies_bouldin = None

        # Organize results
        clusters = {}
        for i, label in enumerate(self.labels):
            if label not in clusters:
                clusters[label] = []
            clusters[label].append(self.program_names[i])

        return clusters

    def cluster_multiple_k(self, k_values: List[int]) -> Dict:
        """
        Perform clustering for multiple K values.

        Args:
            k_values: List of K values to cluster with

        Returns:
            Dictionary: {k: {cluster_id: [program_names]}}
        """
        all_clusterings = {}

        for k in k_values:
            if k > len(self.programs):
                print(f"Warning: K={k} > number of programs ({len(self.programs)}), skipping")
                continue

            print(f"\nClustering with K={k}...")
            clusters = self.cluster(k)
            all_clusterings[k] = clusters

            # Print brief summary
            print(f"  K={k}: {len(clusters)} clusters")
            for cluster_id, progs in clusters.items():
                print(f"    Cluster {cluster_id}: {progs}")

        return all_clusterings

    def export_multiple_k_clusterings(
        self,
        all_clusterings: Dict,
        output_path: str = "multi_k_clustering.json"
    ):
        """
        Export clustering results for multiple K values.

        Args:
            all_clusterings: Results from cluster_multiple_k()
            output_path: Output JSON file path
        """
        export_data = {
            'programs': self.program_names,
            'num_programs': len(self.programs),
            'feature_dimensions': self.feature_matrix.shape[1],
            'clusterings': {}
        }

        for k, clusters in all_clusterings.items():
            export_data['clusterings'][f'k{k}'] = {
                'n_clusters': k,
                'clusters': {
                    f'cluster_{cid}': {
                        'programs': prog_list,
                        'size': len(prog_list)
                    }
                    for cid, prog_list in clusters.items()
                }
            }

        with open(output_path, 'w') as f:
            json.dump(export_data, f, indent=2)

        print(f"\nMulti-K clustering results exported to: {output_path}")

    def print_clusters(self, clusters: Dict):
        """Print clustering results."""
        print(f"\n{'='*60}")
        print(f"Clustering Results ({len(clusters)} groups)")
        print(f"{'='*60}")
        print(f"Inertia: {self.inertia:.2f}")
        if self.silhouette is not None:
            print(f"Silhouette Score: {self.silhouette:.3f} (higher is better, range: -1 to 1)")
            print(f"Davies-Bouldin Index: {self.davies_bouldin:.3f} (lower is better)")
        print()

        for cluster_id in sorted(clusters.keys()):
            programs = clusters[cluster_id]
            print(f"Cluster {cluster_id} ({len(programs)} programs):")
            for prog_name in programs:
                prog = next(p for p in self.programs if p.program_name == prog_name)
                print(f"  - {prog_name:20s} "
                      f"({prog.total_instructions} inst, "
                      f"{len(prog.unique_instructions)} unique)")

            # Show common instructions in this cluster
            common_instructions = self._get_cluster_common_instructions(cluster_id)
            if common_instructions:
                print(f"  Common instructions: {', '.join(list(common_instructions)[:10])}")
            print()

    def _get_cluster_common_instructions(self, cluster_id: int) -> Set[str]:
        """Get instructions common to all programs in a cluster."""
        cluster_programs = [
            p for p, label in zip(self.programs, self.labels)
            if label == cluster_id
        ]

        if not cluster_programs:
            return set()

        common = cluster_programs[0].unique_instructions.copy()
        for prog in cluster_programs[1:]:
            common &= prog.unique_instructions

        return common

    def visualize(self, clusters: Dict, output_path: str = "program_clusters.pdf", 
                  method: str = "tsne"):
        """
        Visualize clustering results using dimensionality reduction.

        Args:
            clusters: Clustering results
            output_path: Output image path
            method: 'tsne' for t-SNE (better for visualization) or 'pca' for PCA
        """
        # Print feature info
        # Check if using frequency only (feature matrix has same dimensions as frequency features)
        if hasattr(self, 'frequency_features_smooth'):
            feature_type = "frequency only" if self.feature_matrix.shape[1] == self.frequency_features_smooth.shape[1] else "binary + frequency (weighted & smoothed)"
        else:
            feature_type = "binary + frequency"
        print(f"Visualization: Using {feature_type} features ({self.feature_matrix.shape[1]} dimensions)")
        # Reduce to 2D
        pca = None  # Initialize for later use
        if method.lower() == "tsne":
            # t-SNE is better for visualization as it preserves local structure
            # Use PCA first to reduce dimensions if too many features
            n_samples, n_features = self.scaled_features.shape
            # PCA can only reduce to at most min(n_samples, n_features)
            max_pca_components = min(n_samples, n_features)
            
            if n_features > 50 and max_pca_components > 1:
                # Pre-reduce with PCA to speed up t-SNE
                # Use at most 50 components, but not more than available
                n_components = min(50, max_pca_components - 1)  # Leave at least 1 dimension
                pca_pre = PCA(n_components=n_components)
                features_reduced = pca_pre.fit_transform(self.scaled_features)
            else:
                features_reduced = self.scaled_features
            
            # Adjust perplexity for small datasets
            # Perplexity should be less than number of samples
            n_samples = len(self.programs)
            # For small datasets, use minimum perplexity for extremely compact visualization
            if n_samples <= 6:
                perplexity = 1  # Minimum perplexity for maximum compactness
            elif n_samples <= 10:
                perplexity = max(1, n_samples // 4)  # For 10 programs, use 2
            else:
                perplexity = min(30, max(2, n_samples // 5))
            
            # Adjust learning rate for extremely compact spacing
            # Lower learning rate = more compact, higher = more spread out
            if n_samples <= 6:
                learning_rate = 10  # Very low learning rate for maximum compactness
            else:
                learning_rate = 15  # Very low for maximum compactness
            
            tsne = TSNE(n_components=2, random_state=42, 
                       perplexity=perplexity,
                       learning_rate=learning_rate,
                       max_iter=3000,  # More iterations for better convergence
                       early_exaggeration=1.0,  # Minimum allowed value (1.0) for maximum compact layout
                       min_grad_norm=1e-7)  # Lower threshold for convergence
            coords_2d = tsne.fit_transform(features_reduced)
            method_name = f"t-SNE (perplexity={perplexity})"
            variance_info = ""
        else:
            # PCA
            pca = PCA(n_components=2)
            coords_2d = pca.fit_transform(self.scaled_features)
            
            # Analyze what each principal component represents
            # Get feature names (instructions)
            if hasattr(self, 'selected_instructions'):
                feature_names = self.selected_instructions
                # Check if using combined features by comparing dimensions
                if self.feature_matrix.shape[1] == len(feature_names) * 2:
                    # Combined features: [binary | frequency]
                    feature_names = [f"{inst}_binary" for inst in feature_names] + \
                                   [f"{inst}_freq" for inst in self.selected_instructions]
                # If only frequency, feature_names already correct
            else:
                feature_names = [f"feature_{i}" for i in range(self.scaled_features.shape[1])]
            
            # Get top contributing features for each PC
            n_top_features = min(10, len(feature_names))
            pc1_contributors = np.argsort(np.abs(pca.components_[0]))[-n_top_features:][::-1]
            pc2_contributors = np.argsort(np.abs(pca.components_[1]))[-n_top_features:][::-1]
            
            print(f"\nPCA Component Analysis:")
            print(f"PC1 explains {pca.explained_variance_ratio_[0]*100:.1f}% of variance")
            print(f"  Top contributing features:")
            for idx in pc1_contributors:
                weight = pca.components_[0][idx]
                print(f"    {feature_names[idx]:20s}: {weight:+.4f}")
            
            print(f"\nPC2 explains {pca.explained_variance_ratio_[1]*100:.1f}% of variance")
            print(f"  Top contributing features:")
            for idx in pc2_contributors:
                weight = pca.components_[1][idx]
                print(f"    {feature_names[idx]:20s}: {weight:+.4f}")
            
            # No coordinate scaling - features are already adjusted to be more compact
            
            method_name = "PCA"
            variance_info = f"\n(PC1: {pca.explained_variance_ratio_[0]*100:.1f}%, PC2: {pca.explained_variance_ratio_[1]*100:.1f}%)"

        # Create larger plot for better spacing
        fig, ax = plt.subplots(figsize=(8, 6))

        # Color map
        colors = plt.cm.tab10(np.linspace(0, 1, len(clusters)))

        # Plot each cluster
        for cluster_id, color in zip(sorted(clusters.keys()), colors):
            mask = self.labels == cluster_id
            cluster_coords = coords_2d[mask]
            # Apply NAME_MAPPING if available
            cluster_names = [NAME_MAPPING.get(self.program_names[i], self.program_names[i]) 
                           for i, m in enumerate(mask) if m]

            # Use smaller point size to reduce overlap
            ax.scatter(cluster_coords[:, 0], cluster_coords[:, 1],
                      c=[color], s=120, alpha=0.7,
                      label=f"Cluster {cluster_id}", edgecolors='black', linewidths=1.2)

            # Add program names with better spacing and arrow
            # Use different offsets for each point to avoid overlap
            offsets = [(10, 10), (-10, 10), (10, -10), (-10, -10), 
                      (15, 5), (-15, 5), (5, 15), (5, -15)]
            for idx, ((x, y), name) in enumerate(zip(cluster_coords, cluster_names)):
                # Cycle through offsets to spread out labels
                offset = offsets[idx % len(offsets)]
                ax.annotate(name, (x, y), 
                           xytext=offset, 
                           textcoords='offset points',
                           fontsize=12, 
                           fontweight='bold',
                           alpha=0.9,
                           bbox=dict(boxstyle='round,pad=0.3', 
                                    facecolor='white', 
                                    edgecolor=color, 
                                    alpha=0.7,
                                    linewidth=1),
                           arrowprops=dict(arrowstyle='->', 
                                         connectionstyle='arc3,rad=0',
                                         color=color,
                                         alpha=0.5,
                                         lw=0.8))

        # Centroids removed as requested

        ax.set_xlabel('PC1', fontsize=14, fontweight='bold')
        ax.set_ylabel('PC2', fontsize=14, fontweight='bold')
        # Set axis limits to make the plot more compact
        ax.set_xlim(-2, 2)
        ax.set_ylim(-2, 2)
        # Increase tick label font size
        ax.tick_params(axis='both', which='major', labelsize=12)
        # Title removed as requested
        ax.legend(loc='best', fontsize=12, prop={'weight': 'bold'})
        ax.grid(True, alpha=0.3)

        plt.tight_layout()
        plt.savefig(output_path, dpi=400, bbox_inches='tight')
        plt.close()

        print(f"Visualization saved to: {output_path}")

    def visualize_heatmap(self, output_path: str = "instruction_heatmap.pdf"):
        """Create heatmap of instruction usage."""
        # Create matrix: programs x top instructions
        top_instructions = sorted(
            self.all_instructions,
            key=lambda x: sum(p.instruction_counts.get(x, 0) for p in self.programs),
            reverse=True
        )[:30]  # Top 30 instructions

        heatmap_data = []
        for program in self.programs:
            row = [program.instruction_percentages.get(inst, 0) * 100
                   for inst in top_instructions]
            heatmap_data.append(row)

        # Create heatmap
        # Apply NAME_MAPPING to program names
        display_names = [NAME_MAPPING.get(name, name) for name in self.program_names]
        fig, ax = plt.subplots(figsize=(8, 6))
        heatmap = sns.heatmap(heatmap_data, annot=True, fmt='.1f', cmap='YlOrRd',
                   xticklabels=top_instructions, yticklabels=display_names,
                   cbar_kws={'label': 'Percentage (%)'}, ax=ax,
                   annot_kws={'size': 10, 'weight': 'bold'})

        ax.set_title('Instruction Usage Heatmap (Top 30 Instructions)', fontsize=14, fontweight='bold')
        ax.set_xlabel('Instructions', fontsize=14, fontweight='bold')
        ax.set_ylabel('Programs', fontsize=14, fontweight='bold')
        ax.tick_params(axis='both', which='major', labelsize=12)
        
        # Adjust colorbar label font
        cbar = heatmap.collections[0].colorbar if heatmap.collections else None
        if cbar:
            cbar.set_label('Percentage (%)', fontsize=12, fontweight='bold')
            cbar.ax.tick_params(labelsize=12)

        plt.xticks(rotation=45, ha='right')
        plt.tight_layout()
        plt.savefig(output_path, dpi=400)
        plt.close()

        print(f"Heatmap saved to: {output_path}")

    def export_results(self, clusters: Dict, output_path: str = "clustering_results.json"):
        """Export clustering results to JSON."""
        results = {
            "n_clusters": len(clusters),
            "n_programs": len(self.programs),
            "metrics": {
                "inertia": float(self.inertia),
                "silhouette_score": float(self.silhouette) if self.silhouette else None,
                "davies_bouldin_index": float(self.davies_bouldin) if self.davies_bouldin else None
            },
            "clusters": {}
        }

        for cluster_id in sorted(clusters.keys()):
            cluster_programs = [
                p for p in self.programs
                if p.program_name in clusters[cluster_id]
            ]

            results["clusters"][f"cluster_{cluster_id}"] = {
                "programs": clusters[cluster_id],
                "size": len(clusters[cluster_id]),
                "common_instructions": list(self._get_cluster_common_instructions(cluster_id)),
                "program_details": [p.get_summary() for p in cluster_programs]
            }

        with open(output_path, 'w') as f:
            json.dump(results, f, indent=2)

        print(f"Results exported to: {output_path}")


def main():
    parser = argparse.ArgumentParser(
        description="Analyze and cluster RISC-V programs based on instruction usage"
    )
    parser.add_argument(
        '--programs',
        nargs='+',
        default=DEFAULT_PROGRAMS,
        help=f"Program names to analyze (default: {' '.join(DEFAULT_PROGRAMS)})"
    )
    parser.add_argument(
        '--n-groups',
        type=int,
        default=None,
        help="Number of clusters (if not specified, will suggest optimal k)"
    )
    parser.add_argument(
        '--base-dir',
        type=Path,
        default=Path(__file__).parent / "output" / "frontend",
        help="Base directory containing program outputs (default: output/frontend)"
    )
    parser.add_argument(
        '--output-dir',
        type=Path,
        default=Path(__file__).parent,
        help="Output directory for results (default: current directory)"
    )
    parser.add_argument(
        '--find-optimal-k',
        action='store_true',
        help="Find optimal number of clusters using elbow method"
    )
    parser.add_argument(
        '--k-values',
        nargs='+',
        type=int,
        default=None,
        help="Cluster for multiple K values (e.g., --k-values 1 2 3 6)"
    )
    parser.add_argument(
        '--export-multi-k',
        type=str,
        default=None,
        help="Export clustering results for multiple K values to JSON file"
    )
    parser.add_argument(
        '--viz-method',
        type=str,
        choices=['tsne', 'pca'],
        default='pca',
        help="Visualization method: 'pca' (more compact, default) or 'tsne' (better separation)"
    )
    parser.add_argument(
        '--use-frequency-only',
        action='store_true',
        help="Use only frequency features (like heatmap). Default uses both instruction types (binary) and frequencies."
    )

    args = parser.parse_args()

    print("="*60)
    print("RISC-V Program Similarity Analysis")
    print("="*60)
    print(f"Base directory: {args.base_dir}")
    print(f"Programs to analyze: {len(args.programs)}")
    print()

    # Load and analyze programs
    print("Loading programs...")
    analyzers = []
    for prog_name in args.programs:
        try:
            analyzer = ProgramAnalyzer(prog_name, args.base_dir)
            analyzers.append(analyzer)
            print(f"  ✓ Loaded {prog_name}")
        except Exception as e:
            print(f"  ✗ Failed to load {prog_name}: {e}")

    if len(analyzers) < 2:
        print("\nError: Need at least 2 programs for clustering")
        return 1

    # Print individual summaries
    for analyzer in analyzers:
        analyzer.print_summary()

    # Create clusterer
    print(f"\n{'='*60}")
    print("Building feature vectors...")
    print(f"{'='*60}")
    # Default to combined features (instruction types + frequencies)
    # use_frequency_only=False means use both binary (instruction types) and frequency features
    use_freq_only = getattr(args, 'use_frequency_only', False)
    # Default: use both instruction types (binary) and frequencies
    # Use top 30 instructions by default (same as heatmap)
    clusterer = ProgramClusterer(analyzers, use_frequency_only=use_freq_only, top_n=30)
    print(f"Total unique instructions across all programs: {len(clusterer.all_instructions)}")
    if use_freq_only:
        print(f"Feature dimensions: {clusterer.feature_matrix.shape[1]} (frequency only)")
    else:
        print(f"Feature dimensions: {clusterer.feature_matrix.shape[1]} "
              f"(binary: {clusterer.binary_features.shape[1]}, "
              f"frequency: {clusterer.frequency_features.shape[1]})")

    # Handle multi-K clustering or single K
    if args.k_values:
        # Multi-K clustering mode
        print(f"\n{'='*60}")
        print(f"Multi-K Clustering Mode")
        print(f"{'='*60}")
        print(f"K values: {args.k_values}")
        print()

        all_clusterings = clusterer.cluster_multiple_k(args.k_values)

        # Export multi-K results
        export_path = args.export_multi_k or str(args.output_dir / "multi_k_clustering.json")
        clusterer.export_multiple_k_clusterings(all_clusterings, export_path)

        # For visualization, use the first K value
        if all_clusterings:
            first_k = min(all_clusterings.keys())
            clusters = all_clusterings[first_k]
            print(f"\nGenerating visualizations for K={first_k}...")
            clusterer.print_clusters(clusters)
            clusterer.visualize(clusters, args.output_dir / f"program_clusters_k{first_k}.pdf", 
                              method=args.viz_method)

    else:
        # Single K clustering mode (original behavior)
        # Find optimal k if requested
        if args.find_optimal_k or args.n_groups is None:
            optimal_k = clusterer.find_optimal_k()
            if args.n_groups is None:
                args.n_groups = optimal_k

        # Perform clustering
        print(f"\nPerforming k-means clustering with k={args.n_groups}...")
        clusters = clusterer.cluster(args.n_groups)

        # Print results
        clusterer.print_clusters(clusters)

        # Visualize
        print(f"{'='*60}")
        print("Generating visualizations...")
        print(f"{'='*60}")
        clusterer.visualize(clusters, args.output_dir / "program_clusters.pdf", 
                          method=args.viz_method)

        # Export results
        clusterer.export_results(clusters, args.output_dir / "clustering_results.json")

    # Always generate heatmap
    print(f"\nGenerating instruction heatmap...")
    clusterer.visualize_heatmap(args.output_dir / "instruction_heatmap.pdf")

    print(f"\n{'='*60}")
    print("✓ Analysis complete!")
    print(f"{'='*60}")

    return 0


if __name__ == "__main__":
    sys.exit(main())
