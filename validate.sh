# obtain most recent express schema
git clone --depth 1 https://github.com/buildingSMART/IFC4.3.x-output /tmp/IFC4.3.x-output

# extract schema identifier
schema_identifier=$(head /tmp/IFC4.3.x-output/IFC.exp | grep "SCHEMA " | cut -c 8-  | rev | cut -c 2- | rev)

# if not already available, perform express rule code generation
if [ ! -f $schema_identifier.py ]; then
cp /tmp/IFC4.3.x-output/IFC.exp $schema_identifier.exp
python -m ifcopenshell.express.rule_compiler $schema_identifier.exp $schema_identifier.py
wget -O $(python -c 'import ifcopenshell.express.rule_compiler; print(ifcopenshell.express.rule_compiler.__file__)') https://raw.githubusercontent.com/IfcOpenShell/IfcOpenShell/eee844e2045e97d72f2266f620d6c7e43d7a353f/src/ifcopenshell-python/ifcopenshell/express/rule_compiler.py
fi

# clean up
rm -rf /tmp/IFC4.3.x-output

# update example models to newest schema identifier 
find models -name '*.ifc' -exec perl -pi -e "s/(?<=FILE_SCHEMA\(\(')IFC\w+/$schema_identifier/" {} \;
find models -name '*.ifc' -exec perl -pi -e "s/(?<=FILE_SCHEMA \(\(')IFC\w+/$schema_identifier/" {} \;

# clone validation service
[ -d ifc-pipeline-validation ] || git clone --recursive --depth 1 https://github.com/AECgeeks/ifc-pipeline-validation/

# validate models
find models -name '*.ifc' -print0 | xargs -0 -n1 python ifc-pipeline-validation/application/validate.py
