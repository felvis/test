#!/bin/bash

TOKEN=$1
if [ -z $TOKEN ]; then
  echo "TOKEN should be passed as FIRST argument"
  exit 1
fi

CODEBUILD_BUILD_SUCCEEDING=$2

PL_NUMBER=$3


if [ -z "$CODEBUILD_BUILD_SUCCEEDING" ]; then  
curl -X POST https://api.github.com/repos/felvis/test/pulls/$PL_NUMBER/reviews -H 'authorization: Bearer $TOKEN' -H 'content-type: application/json' -d '{"body":"Need to be fixed", "event":"REQUEST_CHANGES"}'";

else
curl -X PUT https://api.github.com/repos/felvis/test/pulls/$PL_NUMBER/merge -H 'authorization: Bearer $TOKEN' -H 'content-type: application/json' -d '{"commit_message":"s3link"}'"; 

fi
