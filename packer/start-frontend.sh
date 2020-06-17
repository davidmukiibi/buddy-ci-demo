#!/bin/bash
set -e

npm_start() {
    npm start
}

gulp_sass() {
    sudo gulp sass
}

main() {
    gulp_sass
    npm_start
}

main "$@"