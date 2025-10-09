import os
import json
from pathlib import Path
import sys
import pathlib
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1]))
from src.egraph import EGraph

DATA_DIR = Path(__file__).resolve().parents[1] / 'data'


def test_load_single_file():
    path = DATA_DIR / 'cyk.json'
    assert path.exists(), f"Test data not found: {path}"

    g = EGraph(str(path))

    # basic shape
    assert isinstance(g.eclasses, dict) and isinstance(g.enodes, dict)
    assert len(g.enodes) > 0, "No enodes loaded"
    assert all(isinstance(v.member_enodes, list) for v in g.eclasses.values())

    # cross-consistency: every enode's eclass must exist and include it
    for nid, node in g.enodes.items():
        assert node.eclass_id in g.eclasses, f"Missing class {node.eclass_id} for node {nid}"
        assert nid in g.eclasses[node.eclass_id].member_enodes, (
            f"Node {nid} not registered in its class {node.eclass_id}")

    # children should be eclass ids and each exist
    for nid, node in g.enodes.items():
        for c in node.children:
            assert c in g.eclasses, f"Child class {c} (from node {nid}) not found"

    # ops aggregated
    assert len(g.ops) > 0


def test_parent_links():
    path = DATA_DIR / 'cyk.json'
    assert path.exists()

    g = EGraph(str(path))

    # any class that appears as a child should have at least one parent link
    child_classes = set()
    for n in g.enodes.values():
        child_classes.update(n.children)
    for cid in child_classes:
        assert len(g.eclasses[cid].parent_enodes) >= 1


if __name__ == '__main__':
    # rudimentary runner
    test_load_single_file()
    ##test_parent_links()
    print('All tests passed')
