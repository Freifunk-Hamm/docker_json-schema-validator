FROM python:3.6.9-alpine
LABEL maintainer="christian.weiss@ffhamm.de"

RUN pip install 'jsonschema==3.0.2'

WORKDIR /data
ENTRYPOINT ["jsonschema"]
CMD ["--help"]

