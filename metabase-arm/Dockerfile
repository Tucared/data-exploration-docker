# Simple image for M1 / Apple Silicon Metabase image. Tested on v0.46.3.
# Best for dev on localhost, no certificate support.
# https://github.com/metabase/metabase/issues/13119#issuecomment-1463753101

ARG METABASE_BASE_VERSION=v0.46.3
FROM metabase/metabase:${METABASE_BASE_VERSION} as metabase_image

FROM eclipse-temurin:11

COPY --from=metabase_image /app /app

RUN useradd -ms /bin/sh metabase && chown -R metabase /app
WORKDIR /app
USER metabase

ENTRYPOINT ["/app/run_metabase.sh"]