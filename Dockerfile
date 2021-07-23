FROM python:3.9.6-alpine
LABEL maintainer="christian.weiss@ffhamm.de"

RUN mkdir /home/jsonschema/
RUN addgroup -g 1000 jsonschema && \
    adduser -u 1000 -G jsonschema -s /bin/bash -h /home/jsonschema -D jsonschema
RUN chown -R jsonschema:jsonschema /home/jsonschema/
USER jsonschema

ENV PATH="/home/jsonschema/.local/bin:${PATH}"

RUN pip install --user 'jsonschema==3.2.0'

WORKDIR /data
ENTRYPOINT ["jsonschema"]
CMD ["--help"]

