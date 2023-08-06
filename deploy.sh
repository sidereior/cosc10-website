#!/usr/bin/env sh
set -e
npm run build
cd dist
git init
git add -A
git commit -m 'deploy'
 git push -f git@github.com:<sidereior>/<sidereior>.github.io.git main
cd -