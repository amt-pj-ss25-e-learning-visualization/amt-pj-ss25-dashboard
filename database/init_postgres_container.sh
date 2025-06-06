#!/bin/bash

# Default file
SQL_FILE="dumpfile.sql"

# Check if an argument is provided for the SQL file
if [ $# -eq 1 ]; then
  SQL_FILE="$1"
fi

# Set variables
NAME="amt-pj-database"
USER="admin"
DB="lms"
PASSWORD="mypostgres"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


# Pull the official PostgreSQL image
docker pull postgres:latest
# Create and run the container
docker run -d --name "${NAME}" \
    -e POSTGRES_USER="${USER}" \
    -e POSTGRES_PASSWORD="${PASSWORD}" \
    -e POSTGRES_DB="${DB}" \
    -v "${SCRIPT_DIR}/${SQL_FILE}:/docker-entrypoint-initdb.d/${SQL_FILE}:ro" \
    -p 5432:5432 \
    postgres:latest

echo "Built container ${NAME}"
