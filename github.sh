#!/bin/bash

TOKEN=$1
if [ -z $TOKEN ]; then
  echo "TOKEN should be passed as FIRST argument"
  exit 1
fi

CODEBUILD_BUILD_SUCCEEDING=$2
CODEBUILD_SOURCE_VERSION=$3
CODEBUILD_BUILD_ARN=$4

BUILD_ID=`echo $CODEBUILD_BUILD_ARN | cut -d"/" -f2- | cut -d":" -f2`
PL_NUMBER=`echo $CODEBUILD_SOURCE_VERSION | cut -c 4-`


if [ "$CODEBUILD_BUILD_SUCCEEDING" -eq 0 ]; then 
 curl -X POST "https://api.github.com/repos/felvis/test/pulls/$PL_NUMBER/reviews" -H "authorization: Bearer $TOKEN" -H "content-type: application/json" -d '{"body":"Need to be fixed", "event":"REQUEST_CHANGES"}'; 
 else
 #curl -X PUT "https://api.github.com/repos/felvis/test/pulls/$PL_NUMBER/merge" -H "authorization: Bearer $TOKEN" -H "content-type: application/json" -d '{"commit_title":"TEST1", "commit_message":"TEST2"}';
 S3_LINK='https://s3.amazonaws.com/test7777khkn/$BUILD_ID/artifacts.zip'
 curl -X POST "https://api.github.com/repos/felvis/test/pulls/$PL_NUMBER/reviews" -H "authorization: Bearer $TOKEN" -H "content-type: application/json" -d '{"body":"APPROVED. Link to artifacts - $S3_LINK", "event":"APPROVE"}'; 
 fi
