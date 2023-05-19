# data-exploration-docker

This repository is intended for a quick launch of a lightweight dockerised data exploration stack on Apple silicon, comprising:

- PostgreSQL database for storing data to analyse
- PostgreSQL database as Metabase application database
- Metabase app
- pgAdmin app

## Quick start

1. Build custom Apple silicon-compatible Metabase app image locally
    ```shell
    build-metabase-arm-image
    ````

2. Launch the workspace
    ```shell
    make run
    # pdAdmin accessible on http://localhost:5050/
    # Metabase accessible on http://localhost:3000/
    ````

3. Stop the workspace
    ```shell
    make stop
    ````