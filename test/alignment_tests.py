import os
import sys
import glob
import pytest
import ifcopenshell
import ifcopenshell.express

schema_iden = sys.argv[-1]

schema = ifcopenshell.express.parse(f"{schema_iden}.exp")
ifcopenshell.register_schema(schema)

filenames = glob.glob(
    os.path.join(os.path.dirname(__file__), "../models/**/*.ifc"), recursive=True
)
files = list(map(ifcopenshell.open, filenames))
alignments = [f.by_type("IfcAlignment") for f in files]
pairs = [
    (os.path.basename(fn), al) for fn, als in zip(filenames, alignments) for al in als
]


@pytest.mark.parametrize("filename_alignment", pairs)
def test_alignment_final_segment_length(filename_alignment):
    filename, alignment = filename_alignment
    horizontal = alignment.IsNestedBy[0].RelatedObjects[0]
    last_segment = horizontal.IsNestedBy[0].RelatedObjects[-1]
    segment_length = last_segment.DesignParameters.SegmentLength
    assert (
        segment_length == 0.0
    ), f"In {filename}, {alignment} has final segment length {segment_length}"


@pytest.mark.parametrize("filename_alignment", pairs)
def test_alignment_project_aggregation(filename_alignment):
    filename, alignment = filename_alignment
    while True:
        try:
            previous, alignment = alignment, alignment.Decomposes[0].RelatingObject
        except IndexError:
            alignment = None
        if alignment and alignment.is_a("IfcProject"):
            break
        elif alignment and alignment.is_a("IfcAlignment"):
            continue
        else:
            assert False, f"In {filename}, {previous} decomposes {alignment}"


if __name__ == "__main__":
    pytest.main(["-sx", __file__])
