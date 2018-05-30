#!/bin/bash


if [[ ! $(which java) ]]; then
  echo "ERROR: cannot find java. Please install Java 1.8"
  exit 1
fi

jar_d=jar

if [[ -e $jar_d ]]; then 
  echo "ERROR: JAR directory $jar_d exists, please delete it first"
  exit 1
fi

mkdir -p $jar_d
echo 'Fetching Cromwell JAR'
(cd jar && curl -L -O https://github.com/broadinstitute/cromwell/releases/download/31/cromwell-31.jar)
echo 'Fetching WOMtool JAR'
(cd jar && curl -L -O https://github.com/broadinstitute/cromwell/releases/download/31/womtool-31.jar)
