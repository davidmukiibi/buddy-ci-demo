#!/bin/bash
set -e

start_postgres() {
    /usr/local/pgsql/bin/pg_ctl start -l logfile -D /usr/local/pgsql/data
}

main() {
    start_postgres
}

main "$@"
