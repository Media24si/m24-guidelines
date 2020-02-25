#!/usr/bin/env sh

set -e
npm run build
cd docs/.vuepress/dist

git init
git add -A
git commit -m 'deploy'

git push -f git@github.com:media24si/m24-guidelines.git master:gh-pages

cd -