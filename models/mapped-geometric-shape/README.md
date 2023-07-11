
 The example demonstrates the use of various way to use mapped items to represent a simple geometric form of a building element proxy. 
 All example files use the same representation map being a swept solid defining the shape (a block of 1m x 1m x 2m).




> 
>  NOTE  See the example of "Basic geometric shape" for the definition of the swept solid. Any other shape representation, e.g.
>  'Brep', 'CSG', or 'SurfaceModel' could have been used to represent the representation map.



 The basic structure provided with the sample IFC files include:



* the basic context of the data set provided by *IfcProject* and referenced entities:
	+ *IfcOwnerHistory* for user, application and time stamp where the project data set had been created;
	+ IfcGeometricRepresentationContext for the general context, including representation type, dimension, coordinate system, and precision;
	+ IfcUnitAssignment for the default units used within the data set,
* the basic spatial structure of the project provided by a single *IfcBuilding* with referenced entities:
	+ *IfcLocalPlacement* to create the local object coordinate system of the building being the parant coordinate system for all
	 objects contained within the building;
	+ *IfcRelAggregates* to link the *IfcBuilding* to the *IfcProject* as the uppermost item of the project spatial structure,
* the proxy element having a shape representation provided by a single *IfcBuildingElementProxy* with referenced entities:
	+ *IfcLocalPlacement* to create the local object coordinate system of the proxy relative to the object coordinate system of the building;
	+ *IfcProductDefinitionShape* to define the geometry within the local object coordinate system.



> 
>  Depending on the model view definition some representation types may not be allowed in actual exchange scenarios.
> 


