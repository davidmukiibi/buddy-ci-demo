#!/bin/bash
set -e

export_env_variables() {
    export APP_SECRET=iigMnxLgWdFJppmd3JgZRzOUYLgmjaXX
    export REQUESTS_ORIGIN=*
    export TEST_DATABASE_URL=postgresql://postgres@localhost:5432/reactdb
    export DATABASE_URL=postgresql://postgres@localhost:5432/reactdb
}

run_application_start_command() {
    python run.py
}

npm_start() {
    npm start
}

main() {
    export_env_variables

    run_application_start_command
}

main "$@"