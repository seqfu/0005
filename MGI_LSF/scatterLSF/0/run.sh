export LSB_SUB_ADDITIONAL='docker(seqfu/bionic:libnss)'
export LSB_DEFAULTQUEUE="research-hpc"

wdl=scatterLSF.wdl
cromwell=$CHAMBER_0005_CROMWELL_JAR

java -Dconfig.file=cromwell.config -jar $cromwell run $wdl
