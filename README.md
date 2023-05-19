# data-exploration-docker

1. [data-exploration-docker](#data-exploration-docker)
   1. [Quick start](#quick-start)

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

2. Launch the workspace for the first time
    ```shell
    make run
    # [...]
    #
    # pdAdmin accessible on http://localhost:5050/
    # Metabase accessible on http://localhost:3000/
    ````

3. Connect to pgAdmin using **admin@pgadmin.com** as username and **admin** as password ; then click on **Add New Server** to connect to your source database:
   1. General
      1. Name: **source-data-db** (can be anything!)
   2. Connection
      1. Host name/address: **source-data-db** (corresponds to service name)
      2. Port: **5432** (default PostgreSQL port)
      3. Username: **user** (from environment variables)
      4. Password: **password** (from environment variables)

4. Stop the workspace
    ```shell
    make stop
    ````