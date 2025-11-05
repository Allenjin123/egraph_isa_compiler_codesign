import os
import json
from pathlib import Path
import sys
import pathlib
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1]))
from src.egraph import EGraph

DATA_DIR = Path(__file__).resolve().parents[1] / 'data'


def test_load_single_file():
    # path = DATA_DIR / '5.json'
    # assert path.exists(), f"Test data not found: {path}"

    g = EGraph(["5.json", "4.json"])  # relative to src/

    # basic shape
    assert isinstance(g.eclasses, dict) and isinstance(g.enodes, dict)
    assert len(g.enodes) > 0, "No enodes loaded"
    assert all(isinstance(v.member_enodes, set) for v in g.eclasses.values())

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
    # print all ops (name -> count) in one line for quick inspection
    print('OPS:', {name: op.count for name, op in g.ops.items()})


def test_parent_links():
    # path = DATA_DIR / 'saturation_5.json'
    # assert path.exists(), f"Test data not found: {path}"

    g = EGraph(["5.json", "4.json"])  # relative to src/

    # any class that appears as a child should have at least one parent link
    child_classes = set()
    for n in g.enodes.values():
        child_classes.update(n.children)
    for cid in child_classes:
        assert len(g.eclasses[cid].parent_enodes) >= 1

    # stronger check: each parent's id should match the enode that lists it as child
    for nid, node in g.enodes.items():
        for cid in node.children:
            assert nid in g.eclasses[cid].parent_enodes, (
                f"EClass {cid} should list {nid} as a parent")


def test_merge_multiple_files():
    # Use small synthetic graphs in src folder
    base = pathlib.Path(__file__).resolve().parents[1]
    f4 = '4.json'
    f5 = '5.json'
    g = EGraph([str(f4), str(f5)])
    # Multiple prefixed roots should be present via the added global root
    assert len(g.enodes) > 0
    # All child eclasses of any enode exist
    for nid, node in g.enodes.items():
        for cid in node.children:
            assert cid in g.eclasses


if __name__ == '__main__':
    # rudimentary runner
    test_load_single_file()
    test_parent_links()
    test_merge_multiple_files()
    print('All tests passed')
