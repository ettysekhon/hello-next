#!/usr/bin/env bash

set -e

GIT_SHA=$(git rev-parse HEAD)
APP=$1
ENV=$2
TAG="deploy-$GIT_SHA@$APP-$ENV"

echo "pushing git tag: deploy-$GIT_SHA@$APP-$ENV"

git tag $TAG
git push --tags