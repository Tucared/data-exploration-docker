# data-exploration-docker

This repository is intended for a quick launch of a lightweight dockerised data exploration stack, comprising:

- PostgreSQL database, for storing source data to analyse
- PostgreSQL database, as Metabase application database
- Metabase app, for data visualisation
- pgAdmin app, for database administration

Databases are persistent on machine, meaning stopping and running the stack again will preserve its data and dashboards.

**Table of contents**
1. [data-exploration-docker](#data-exploration-docker)
   1. [Quick start](#quick-start)
      1. [x86/amd64 (most machines)](#x86amd64-most-machines)
      2. [ARM (Apple Silicon)](#arm-apple-silicon)
   2. [Configuration](#configuration)
      1. [pdAdmin](#pdadmin)
      2. [Metabase](#metabase)


## Quick start

### x86/amd64 (most machines)

1. Duplicate `.env.example` file to a `.env` file.

2. Launch the workspace for the first time
   ```shell
   make run
   # [...]
   #
   # pdAdmin accessible on http://localhost:5050/
   # Metabase accessible on http://localhost:3000/
   ````

3. Stop the workspace
   ```shell
   make stop
   ```

### ARM (Apple Silicon)

Metabase currently does not offer an official ARM docker image, hence to run this stack on your Apple Silicon you have the choice between:

**Through locally built Metabase ARM image** (preferred)

1. Build custom Apple silicon-compatible Metabase app image locally.
   ```shell
   make build-metabase-arm-image
   ```

2. Duplicate `.env.example` file to a `.env` file

3. Append suffix `-arm` to **METABASE_VERSION_TAG** (e.g., *v0.46.3* becomes *v0.46.3-arm*)

4. Launch the workspace for the first time
   ```shell
   make run
   # [...]
   #
   # pdAdmin accessible on http://localhost:5050/
   # Metabase accessible on http://localhost:3000/
   ````

5. Stop the workspace
   ```shell
   make stop
   ```

**Through x86/amd64 emulation with Docker**

1. Turn on x86/amd64 emulation with Docker ([instruction](https://levelup.gitconnected.com/docker-on-apple-silicon-mac-how-to-run-x86-containers-with-rosetta-2-4a679913a0d5#:~:text=How%20to%20enable%20Rosetta%202,and%20install%20any%20available%20updates.))

2. Launch the workspace for the first time
   ```shell
   make run
   # [...]
   #
   # pdAdmin accessible on http://localhost:5050/
   # Metabase accessible on http://localhost:3000/
   ```

3. Stop the workspace
   ```shell
   make stop
   ```

## Configuration

### pdAdmin

Connect to pgAdmin using **admin@pgadmin.com** as username and **admin** as password ; then click on **Add New Server** to connect to your source database:
- **General**
   - Name: **source-data-db** (can be anything!)
- **Connection**
   - Host name/address: **source-data-db** (corresponds to service name)
   - Port: **5432** (default PostgreSQL port)
   - Username: **user** (from environment variables)
   - Password: **password** (from environment variables)

### Metabase

**TODO**