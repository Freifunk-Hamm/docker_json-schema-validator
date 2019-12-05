# Dockerized jsonschema
This git repository contains a Dockerfile to dockerize the command line tool "jsonschema", a great tool to validate JSON Schema files of draft-03, draft-04, draft-06 and draft-07.

You can find more information about json-schema-validator at:

-    https://github.com/Julian/jsonschema (source code)
-    https://pypi.org/project/jsonschema/#description (documentation)

# Run Validator
## Prepare
Cache official JSON schema locally for later use on validation process.
```
# Get JSON Schema Draft 3 (cache as local file)
wget -O draft-03.schema.json http://json-schema.org/draft-03/schema#
# Get JSON Schema Draft 4 (cache as local file)
wget -O draft-04.schema.json http://json-schema.org/draft-04/schema#
# Get JSON Schema Draft 6 (cache as local file)
wget -O draft-06.schema.json http://json-schema.org/draft-06/schema#
# Get JSON Schema Draft 7 (cache as local file)
wget -O draft-07.schema.json http://json-schema.org/draft-07/schema#
```

## JSON Schema Draft-03
Validate if JSON file (toBeChecked.json) is valid against JSON schema draft-03:
```
docker run -it --rm -v $(pwd):/data freifunk-hamm/dockerized_jsonschema -i toBeChecked.json draft-03.schema.json
```

## JSON Schema Draft-04
Validate if JSON file (toBeChecked.json) is valid against JSON schema draft-04: 
```
docker run -it --rm -v $(pwd):/data freifunk-hamm/dockerized_jsonschema -i toBeChecked.json draft-04.schema.json
```

## JSON Schema Draft-06
Validate if JSON file (toBeChecked.json) is valid against JSON schema draft-06:
```
docker run -it --rm -v $(pwd):/data freifunk-hamm/dockerized_jsonschema -i toBeChecked.json draft-06.schema.json
```

## JSON Schema Draft-07
Validate if JSON file (toBeChecked.json) is valid against JSON schema draft-07:
```
docker run -it --rm -v $(pwd):/data freifunk-hamm/dockerized_jsonschema -i toBeChecked.json draft-07.schema.json
```
