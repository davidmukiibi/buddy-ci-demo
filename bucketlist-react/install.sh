#!/usr/bin/env bash
set -e

npm install -g gulp-cli
npm install
gulp sass
npm start