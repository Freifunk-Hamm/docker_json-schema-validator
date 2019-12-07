![Docker Stars](https://img.shields.io/docker/stars/freifunkhamm/jsonschema.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/freifunkhamm/jsonschema.svg)
![Docker Automated](https://img.shields.io/docker/cloud/automated/freifunkhamm/jsonschema)
![Docker Build](https://img.shields.io/docker/cloud/build/freifunkhamm/jsonschema)
![Docker Layers](https://img.shields.io/microbadger/layers/freifunkhamm/jsonschema/latest)
![Docker Image Size](https://img.shields.io/microbadger/image-size/freifunkhamm/jsonschema/latest)


# Dockerized jsonschema
This git repository contains a Dockerfile to dockerize the command line tool "jsonschema", a great tool to validate JSON Schema files of draft-03, draft-04, draft-06 and draft-07.
This dockerized tool is intended to be used in CI / CD pipelines (e.g. Github Actions, Travis-CI, etc.). 

You can find more information about jsonschema validator at:

-    https://github.com/Julian/jsonschema (source code)
-    https://pypi.org/project/jsonschema/#description (documentation)

Docker:
* https://github.com/Freifunk-Hamm/docker_jsonschema (Dockerfile, Github)
* https://hub.docker.com/r/freifunkhamm/jsonschema (Docker Image, Dockerhub)

# Install
Instead of typing a long docker command you can copy a tiny shell script to your PATH:
```
sudo cp jsonschema /usr/local/bin
```

You can operate on files in your current work dir, as you would normally do.
Your work dir is mounted into the docker container for file processing (see script file above: `-v $(pwd):/data`).

Please note that above shell script will download the latest version of this tool, at the point in time, when you run this dockerized tool the first time.
It will not auto-update to the latest version if a new release will become available in the future. You have to run:
`docker image rm freifunkhamm/jsonschema` to delete local cached image and to allow to update to latest version on next run.

If you want to use a specific version you can replace `latest` in the above shell script by a concrete version number.
Available versions are listed here: https://hub.docker.com/r/freifunkhamm/jsonschema/tags

# Run
You can use a dockerized tool similar to a tool that use installed locally to your workstation.

## Show version:
```
jsonschema -v
``` 

## Show help:
```
jsonschema -h
```
This will print you help info about jsonschema. 
There is also a wiki page available: https://python-jsonschema.readthedocs.io/en/latest/

# Validate

## Validate your custom schema

### Prepare (optional)
Warning: jsonschema is not using the official meta-schema, but patched schema files.
If you want to use the official (unpatched) JSON schema meta schemas then you need to cache them. But be warned, the patched jsonschema-version is more closer to the official specs of json schema. 
We recommend to use the build-in patched meta schemas.

To cache the official JSON schema (meta schema) locally for later use on validation process run:
```
# Get JSON Schema Draft 3 (cache as local file)
wget -O official.draft-03.schema.json http://json-schema.org/draft-03/schema#
# Get JSON Schema Draft 4 (cache as local file)
wget -O official.draft-04.schema.json http://json-schema.org/draft-04/schema#
# Get JSON Schema Draft 6 (cache as local file)
wget -O official.draft-06.schema.json http://json-schema.org/draft-06/schema#
# Get JSON Schema Draft 7 (cache as local file)
wget -O official.draft-07.schema.json http://json-schema.org/draft-07/schema#
```

### JSON Schema Draft-03
To check if your customSchema.json is a valid JSON schema draft-03 (patched one) run:
```
jsonschema --validator Draft3Validator customSchema.json
```
To validate your customSchema.json against official JSON schema draft-03 run:
```
jsonschema -i customSchema.json official.draft-03.schema.json
```

### JSON Schema Draft-04
To check if your customSchema.json is a valid JSON schema draft-04 (unofficial patched one) run:
Validate if JSON file (toBeChecked.json) is valid against JSON schema draft-04: 
```
jsonschema --validator Draft4Validator customSchema.json
```
To validate your customSchema.json against official JSON schema draft-04 run:
```
jsonschema -i customSchema.json official.draft-04.schema.json
```

### JSON Schema Draft-06
To check if your customSchema.json is a valid JSON schema draft-06 (unofficial patched one) run:
```
jsonschema --validator Draft6Validator customSchema.json
```
To validate your customSchema.json against official JSON schema draft-06 run:
```
jsonschema -i customSchema.json official.draft-06.schema.json
```

### JSON Schema Draft-07
To check if your customSchema.json is a valid JSON schema draft-07 (unofficial patched one) run:
```
jsonschema --validator Draft7Validator customSchema.json
```
To validate your customSchema.json against official JSON schema draft-07 run:
```
jsonschema -i customSchema.json official.draft-07.schema.json
```

## Validate your JSON instance against your custom schema
To validate your instanceData.json against your customSchema.json run:
```
jsonschema -i instanceData.json customSchema.json
```

# Contribute / Build your own version
Fork this git repo, change Dockerfile, test it and send us pull request.