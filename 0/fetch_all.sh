#!/bin/bash

./0/fetch_jars.sh
./0/fetch_gatk.sh

for d in Broad/helloHaplotypeCaller Broad/jointCallingGenotypes Broad/simpleVariantDiscovery Broad/simpleVariantSelection; do 
  (cd $d; ./0/fetch_data.sh)
done
