#!/usr/bin/env bash
GITHUB_REF=refs/tags/deploy-9ab79085bdacc0ccb804ae58496971dca086a0e4-2020-01-13T21:59:48Z@hpny-test
TAG=${GITHUB_REF/*tags\//};
APP_ENV=${TAG#*@};
APP=${APP_ENV%%-*};
ENV=${APP_ENV#*-};
echo 'GITHUB_REF:' $GITHUB_REF
echo 'TAG:' $TAG
echo 'APP_ENV:' $APP_ENV
echo 'ENV:' $ENV
echo 'APP:' $APP
