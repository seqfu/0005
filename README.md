Cromwell WDL experiments
========================

$Id$


Requirements
------------

The fetcher scripts require `curl`, except for the Broad
`0/fetch_data.sh` scripts which require `wget`

Java 8 (and possibly NOT 9 or 10)


Install
-------

Download Cromwell and WOMtool JARs

    0/fetch_jars.sh
    0/fetch_gatk.sh

Download the above plus all data files for Broad tutorials

    0/fetch_all.sh


Cleanup
-------

Remove all generated output files in all directories

    0/clean_all_outputs.sh

Remove all downloaded data (by `0/fetch_data.sh`)

    0/clean_all_data.sh

Remove all downloaded files

    0/clean_all_downloaded.sh

Run all of the above

    0/clean_all.sh


Usage (all)
-----------

The location of the Cromwell and WOMtool JARs is specified by 

    CHAMBER_0005_CROMWELL_JAR
    CHAMBER_0005_WOMTOOL_JAR

and can be appropriately set to the JARs downloaded by `0/fetch_jars.sh`

    . 0/env.sh

in the root of this repository. Most of the per-experiment scripts rely
on this variable being set.


Simple local experiments
------------------------

All of these can be validated and run 

    cd DIRECTORY
    ./0/validate.sh
    ./0/run.sh
    
    hello         Basic example with simple input


MGI LSF experiments
-------------------

Simple experiments running scatter and serial tasks with the MGI 
cluster as backend

    MGI_LSF/
      simpleLSF     Three serial tasks
      scatterLSF    Three scatter tasks followed by two serial tasks
      dockerLSF     As in "simpleLSF" but with a docker container specified
                    for each task


Modified local Broad tutorials
------------------------------

The directories

    Broad/
      helloHaplotypeCaller
      simpleVariantSelection
      simpleVariantDiscovery
      jointCallingGenotypes

contain files modified from four of the tutorials at 

https://software.broadinstitute.org/wdl/documentation/topic?name=wdl-tutorials

All of them are designed to use the Cromwell, WOMtool, and GATK files
downloaded in the `Install` section, as well as downloaded data and
modified versions of the tutorial files that work with GATK 4.x. To run 
each do eg

    cd helloHaplotypeCaller

    # If 0/fetch_all.sh was not run, download the data files
    0/fetch_data.sh

    # Run Cromwell
    0/run.sh

    # To clean up Cromwell output directories
    0/clean_outputs.sh


Credits
-------

    helloHaplotypeCaller
    simpleVariantSelection
    simpleVariantDiscovery
    jointCallingGenotypes

are all modified from the original Broad tutorial examples at

https://software.broadinstitute.org/wdl/documentation/topic?name=wdl-tutorials

See the `README` under each for links 





