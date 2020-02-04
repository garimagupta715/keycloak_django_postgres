#!/bin/bash

set -e

if [[ $STACK_NAME == "trying-test" || $STACK_NAME == "staging-test" ]]; then
    echo Terminating connections

    psql -f terminate_connections.sql

    echo ===========

    echo Dropping the database

    dropdb ${PGDATABASE}

    echo ===========

    echo Creating the database

    createdb ${PGDATABASE}
else
    echo This helper can be only used in trying-test and staging-test envs
fi
