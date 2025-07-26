# 📊 Dashboard — Modeling and Visualizing Learning Progress in E-learning

This repository contains the **frontend** and **backend** applications
as well as the **database** configuration including synthetic seed data for the project **_Modeling and Visualizing Learning Progress in E-learning_**, developed as part of the module _Advanced Media Technologies (SS2025)_ at **Technische Universität Berlin**.

## Getting Started - The Quick Way

If you have not already, install [Docker Compose](https://docs.docker.com/compose/install/) (tested with v2.33.1), for instance by installing [Docker Desktop](https://docs.docker.com/desktop/).
Then run

```bash
docker compose up
```

## Getting Started - The Manual Way

If you prefer running everything manually, then you can alternatively follow these steps.

**Database**\
First we need to setup and run the database inside a docker container.
You can use the script [init_postgres_container.sh](./database/init_postgres_container.sh).
Take note of the environment vars here and transfer them to the environment of the backend folder.

**Backend & Frontend**\
Install node.js: **Node.js v20.x** (LTS recommended), ideally with [nvm](https://github.com/nvm-sh/nvm)

```bash
nvm install 20
nvm use 20
```

Make sure that both `./backend/.env` and `./frontend/.env` exist.
In the backend, the environment file should contain the following content, matching the values from the database setup step.

```bash
DB_HOST=localhost
DB_PORT=5432
DB_NAME=lms
DB_USER=admin
DB_PASSWORD=mypostgres
```

and also general environment variables.

```bash
PORT=3000
NODE_ENV=development
```

In the frontend, the environment file only needs to specify where the backend server is hosted:

```bash
VITE_SERVER="http://localhost:3000"
```

Now, from the root directory, install the dependencies and start the application:

```bash
npm install
npm start
```

## Synthetic Data Generation
Please follow [this guideline](./database/README.md) to generate and import additional synthetic course and student interaction data.
