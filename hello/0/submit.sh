#!/bin/bash

if [[ $(which gsed) ]]; then
  sed=gsed
else
  sed=sed
fi

java -jar $CHAMBER_0005_WOMTOOL_JAR inputs hello.wdl > hello.json
$sed -i 's/String/Hello, JSON inputs!/' hello.json
java -jar $CHAMBER_0005_CROMWELL_JAR submit -i hello.json hello.wdl
