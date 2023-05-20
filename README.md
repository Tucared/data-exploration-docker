# data-exploration-docker

This repository is intended for a quick launch of a lightweight dockerised data exploration stack on Apple silicon (ARM), comprising:

- PostgreSQL database for storing data to analyse
- PostgreSQL database as Metabase application database
- Metabase app
- pgAdmin app

Databases are persistent on machine, meaning stopping and running the stack again will preserve its data and dashboards.

## Installation

1. Duplicate `.env.example` file to a `.env` file.

2. Build custom Apple silicon-compatible Metabase app image locally.
    ```shell
    make build-metabase-arm-image
    ````

3. Launch the workspace for the first time
    ```shell
    make run
    # [...]
    #
    # pdAdmin accessible on http://localhost:5050/
    # Metabase accessible on http://localhost:3000/
    ````

4. Connect to pgAdmin using **admin@pgadmin.com** as username and **admin** as password ; then click on **Add New Server** to connect to your source database:
   - **General**
      - Name: **source-data-db** (can be anything!)
   - **Connection**
      - Host name/address: **source-data-db** (corresponds to service name)
      - Port: **5432** (default PostgreSQL port)
      - Username: **user** (from environment variables)
      - Password: **password** (from environment variables)

5. Stop the workspace
    ```shell
    make stop
    ````