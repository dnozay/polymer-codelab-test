#!/bin/bash -xe

# This script assumes you just ran:
#
#     polymer build
#
# Which clears the build/default directory.

cd build/default/
if [ -d .git ]; then
  echo "Detected .git directory, is it already published?"
  exit 1
fi
ORIGIN=$(git remote get-url origin)
EMAIL=$(git config user.email)

git init .
git remote add origin "$ORIGIN"
git config user.email "$EMAIL"
git add .
git commit -m "docs"
git push -f origin master:gh-pages

