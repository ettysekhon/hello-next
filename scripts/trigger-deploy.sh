#!/usr/bin/env bash

set -e

GIT_SHA = git rev ...
TAG=`deploy-$GITHUB_SHA@$APP_ENV`

deploy-${GIT_SHA}@hpny-uat
git tag TAG
git push --tags