export LSB_DEFAULTQUEUE="research-hpc"

wdl=dockerLSF.wdl
cromwell=$CHAMBER_0005_CROMWELL_JAR

java -Dconfig.file=cromwell.config -jar $cromwell run $wdl
