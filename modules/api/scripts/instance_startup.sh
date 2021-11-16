#!/bin/bash

echo "[LAUNCH] Open Targets Genetics Portal API"
docker run -d \
  -p ${API_PORT}:${API_PORT} \
  --log-driver=gcplogs \
  -e SLICK_CLICKHOUSE_URL='${SLICK_CLICKHOUSE_URL}' \
  -e ELASTICSEARCH_HOST='${ELASTICSEARCH_HOST}' \
  quay.io/opentargets/genetics-api:${API_VERSION}
