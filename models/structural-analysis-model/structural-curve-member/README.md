﻿ 
 This example includes three structural curve members forming a simple frame, and a single load case of a linear
 distributed load.
 



 The example includes three structural curve members connected in series, forming two columns and a beam, where
 the columns have rigid boundary conditions with respect to the ground. Each curve member has a material profile
 set defined using an I-Shape profile of steel material. The profile has properties indicating area and moments
 of inertia. The material has properties indicating density, modulus of elasticity, modulus of rigidity, and
 yield strength. One load case is defined, having a constant linear distribution over half of the beam. See
 Figure 510 for the geometric and topological representation of the structural members.
 


![structural_analysis_fig-1.png 118,0 KB](../../figures/examples/structural_analysis_curve-1.png)

Figure 510 — Structural members and actions

The load case has calculated results included, consisting of point forces and moments at each point connection
on the ground. See Figure 511 for the represenation of the structural members with
reactions.
 
![structural_analysis_fig-2.png 109,0 KB](../../figures/examples/structural_analysis_curve-2.png)

Figure 511 — Structural members and reactions
 

The *IfcRelConnectsStructuralElements* relationship links a curve member to a point connection. See Figure 512 for an instantiation diagram.
 
![structural_analysis_fig-3.png 48,1 KB](../../figures/examples/structural_analysis_curve-3.png)

Figure 512 — Structural connection graph

The *IfcRelConnectsStructuralActivity* relationship links a load action to a curve member. See Figure 513 for an instantiation diagram.
 


![structural_analysis_fig-4.png 43,1 KB](../../figures/examples/structural_analysis_curve-4.png)

Figure 513 — Structural load graph


