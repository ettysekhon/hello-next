#!/usr/bin/env bash

set -e

if [ "$#" -ne 2 ]
then
  echo 'Usage: run-deploy hpny uat'
  exit 1
fi

APP=$1
ENV=$2
HPSF=hpsf
HPNY=hpny
STAGING=staging
TEST=test
UAT=uat
PRODUCTION=production

if [[ $APP != $HPSF && $APP != $HPNY ]]
then
  echo "Application ($APP) not supported"
  exit 1
fi

if [[ $ENV != $STAGING && $ENV != $UAT && $ENV != $TEST && $ENV != $PRODUCTION ]]
then
  echo "Environment ($ENV) not supported"
  exit 1
fi

GIT_SHA=$(git rev-parse HEAD)
UTC_DATE_TIME=`date -u +"%Y-%m-%dT%H-%M-%S"`
TAG="deploy-$GIT_SHA-${UTC_DATE_TIME}@$APP-$ENV"

echo "pushing git tag: $TAG"

git tag $TAG
git push --tags
