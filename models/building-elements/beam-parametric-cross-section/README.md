An *IfcBeam* is a commonly exchanged with a parametric definitions of the cross section shape.

The example includes the local placement, the body shape representation, the material profile set assignment, the beam occurrence and beam type definitions. The focus points are the use of cardinal points to align the beam profile to the axis, the use of parametric profile definitions and the assignment of material information to the profile.

![standard_case_element_beam-2.png 44,2 KB](../../figures/examples/standard_case_element_beam-1.png)

Figure 493 — Beam occurrences

![standard_case_element_beam-2.png 2,6 KB](../../figures/examples/standard_case_element_beam-2.png)

Figure 494 — Beam profile and cardinal point usage

![standard_case_element_beam-3.png 18,1 KB](../../figures/examples/standard_case_element_beam-3.png)

Figure 495 — Beam type graph

![standard_case_element_beam-4.png 21,2 KB](../../figures/examples/standard_case_element_beam-4.png)

Figure 496 — Beam occurrence graph

The beam 'A-9' in Figure 494 is an occurrence of the 'IPE220' type having an
I-Shape profile, placed along an axis using the upper-right cardinal point.

The example in Figure 493 declares two parametric beam types, one with an I-Shape
profile and the other with a T-Shape profile. Each type has nine occurrences, using various cardinal
points to align the profiles.

The cardinal point of the beam 'A-9' is set to the upper-right, indicating that the 'Body' representation
should be generated with the upper-right of the profile aligned along the curve of the 'Axis
representation.

The 'IPE220' beam type in Figure 495 is represented by *IfcBeamType*. As a
parametric definition, this beam type does not have any geometric representation, rather it has a
material profile set association indicating a cross-section which may be applied to paths defined at
occurrences.

Each beam occurrence as in Figure 496 is represented by *IfcBeam*. The *IfcMaterialProfileSetUsage* entity indicates the alignment of the
material profile set according to cardinal point. The *IfcMaterialProfileSet* indicates a single
material profile. The *IfcMaterialProfile* indicates an I-Shape cross-section of steel. The
*IfcIShapeProfileDef* indicates shape parameters of the I-Shape profile. The *IfcMaterial*
indicates the steel material, which could be further elaborated with structural properties, surface
styles, and fill area styles.
