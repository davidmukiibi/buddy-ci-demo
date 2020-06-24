#!/bin/bash
set -e

export_env_variables() {
    export APP_SECRET=iigMnxLgWdFJppmd3JgZRzOUYLgmjaXX
    export REQUESTS_ORIGIN=*
    export TEST_DATABASE_URL=postgresql://buddy:buddypassword@localhost:5432/buddydb
    export DATABASE_URL=postgresql://buddy:buddypassword@localhost:5432/buddydb
}

run_application_start_command() {
    python run.py
}

main() {
    export_env_variables
    run_application_start_command
}

main "$@"