# 📊 Dashboard — Modeling and Visualizing Learning Progress in E-learning

This repository contains the **frontend** and **backend** applications
as well as the **database** configuration including dummy data for the project **_Modeling and Visualizing Learning Progress in E-learning_**, developed as part of the module _Advanced Media Technologies (SS2025)_ at **Technische Universität Berlin**.

## Getting Started - The Quick Way

If you have not already, install docker compose, for instance by installing Docker Desktop.
Then run

```bash
docker compose up
```

## Getting Started - The Manual Way

If you prefer running everything manually, then you can alternatively follow these steps.

**Database**\
First we need to setup and run the database inside a docker container.
You can use the script [init_postgres_container.sh](./database/init_postgres_container.sh).
Take note, of the environment vars here to transfer them to the environment of the backend folder.

**Backend & Frontend**\
Install node.js: **Node.js v20.x** (LTS recommended), ideally with [nvm](https://github.com/nvm-sh/nvm)

```bash
nvm install 20
nvm use 20
```

Make sure in that the both, `./backend/.env` and `./frontend/.env` exist.
In the backend, the file should contain following environment variables matching the values from the database setup step.

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

In the frontend, the file only needs to contain were the backend server is hosted

```bash
VITE_SERVER="http://localhost:3000"
```

Now, from the root directory, install dependencies for both the frontend and backend by executing following command:

```bash
npm install
```

The application can now be started with

```bash
npm start
```
