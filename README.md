# data-exploration-docker

The purpose of this repository is to provide a convenient setup for a lightweight data exploration stack using Docker. The stack includes the following components:

- PostgreSQL database: Used for storing the data to be analysed.
- PostgreSQL database: Serves as the application database for Metabase.
- Metabase app: Enables data visualization and exploration.
- pgAdmin4 app: Facilitates database administration.

> It's important to note that the databases are persistent on the machine. This means that stopping and restarting the stack will preserve the data and dashboards.

## Quick start

One line of command suffices to spin the stack up:
```shell
docker-compose up -d
# pgAdmin: http://localhost:5050/
#    Username: admin@pgadmin.com
#    Password: admin
#
# Metabase: http://localhost:3000/
```

To shut the stack down:
```shell
docker-compose down
```

<details>
<summary><b>For ARM (Apple Silicon)</b></summary>

Metabase currently does not offer an official ARM docker image, hence to run this stack on your Apple Silicon you have the choice between:

**Through locally built Metabase ARM image** (preferred)

1. Build custom Apple silicon-compatible Metabase app image locally.
   ```shell
   make build-metabase-arm-image
   ```

2. Duplicate `.env.example` file to a `.env` file.

3. Append suffix `-arm` to **METABASE_VERSION_TAG** (e.g., *v0.46.3* becomes *v0.46.3-arm*).

4. Follow [Quick start](#quick-start).

**Through x86/amd64 emulation with Docker**

1. Turn on x86/amd64 emulation with Docker ([instructions](https://levelup.gitconnected.com/docker-on-apple-silicon-mac-how-to-run-x86-containers-with-rosetta-2-4a679913a0d5#:~:text=How%20to%20enable%20Rosetta%202,and%20install%20any%20available%20updates.)), this significantly affects performance.

2. Follow [Quick start](#quick-start).

</details>

## Connecting to source database

### Using pgAdmin and Metabase

In order to administrate and perform data exploration on our source database, pgAdmin and Metabase need to connect to it.

**Source database credentials**
| pgAdmin            | Metabase      | Value to use   | comment        |
|--------------------|---------------|----------------|----------------|
| Name               | Display name  | source-data-db | Can be changed |
| Host name/address  | Host          | source-data-db |                |
| Port               | Port          | 5432           |                |
| *(Not applicable)* | Database name | source-data-db |                |
| Username           | Username      | user           |                |
| Password           | Password      | password       |                |

### Using `psql` CLI

To connect to database from your machine using `psql` (needs to be installed), not from the container, use following command:
```shell
make psql-connect-source-db
```