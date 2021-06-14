#!/bin/bash

echo "[LAUNCH] Open Targets Genetics Portal API"
docker run -d \
  -p ${OTP_API_PORT}:${OTP_API_PORT} \
  -e SLICK_CLICKHOUSE_URL='${SLICK_CLICKHOUSE_URL}' \
  -e ELASTICSEARCH_HOST='${ELASTICSEARCH_HOST}' \
  quay.io/opentargets/genetics-api:${PLATFORM_API_VERSION}
