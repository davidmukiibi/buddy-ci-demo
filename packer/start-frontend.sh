#!/bin/bash
set -e

npm_start() {
    npm start
}

main() {
    npm_start
}

main "$@"