workflow jointCallingGenotypes {

  File inputSamplesFile
  Array[Array[File]] inputSamples = read_tsv(inputSamplesFile)
  File gatk
  File refFasta
  File refIndex
  File refDict  

  scatter (sample in inputSamples) {
    call HaplotypeCallerERC { 
      input: bamFile=sample[1], 
        bamIndex=sample[2],
        sampleName=sample[0], 
        RefFasta=refFasta, 
        GATK=gatk, 
        RefIndex=refIndex, 
        RefDict=refDict 
    }
  }
  call CombineGVCFs { 
    input: GVCFs=HaplotypeCallerERC.GVCF, 
        sampleName="CEUtrio", 
        RefFasta=refFasta, 
        GATK=gatk, 
        RefIndex=refIndex, 
        RefDict=refDict 
  }

  call GenotypeGVCFs { 
    input: combinedGVCF=CombineGVCFs.combinedGVCF, 
        sampleName="CEUtrio", 
        RefFasta=refFasta, 
        GATK=gatk, 
        RefIndex=refIndex, 
        RefDict=refDict 
  }
}

task HaplotypeCallerERC {

  File GATK
  File RefFasta
  File RefIndex
  File RefDict

  String sampleName
  File bamFile
  File bamIndex

  command {
    java -jar ${GATK} \
        HaplotypeCaller \
        -ERC GVCF \
        -R ${RefFasta} \
        -I ${bamFile} \
        -O ${sampleName}_rawLikelihoods.g.vcf 
  }
  output {
    File GVCF = "${sampleName}_rawLikelihoods.g.vcf"
  }
}

task CombineGVCFs {

  File GATK
  File RefFasta
  File RefIndex
  File RefDict

  String sampleName
  Array[File] GVCFs

  command {
    java -jar ${GATK} \
        CombineGVCFs \
        -R ${RefFasta} \
        -V ${sep=" -V " GVCFs} \
        -O ${sampleName}_combinedVariants.vcf
  }
  output {
    File combinedGVCF = "${sampleName}_combinedVariants.vcf"
  }
}

task GenotypeGVCFs {

  File GATK
  File RefFasta
  File RefIndex
  File RefDict

  String sampleName
  File combinedGVCF

  command {
    java -jar ${GATK} \
        GenotypeGVCFs \
        -R ${RefFasta} \
        -V ${combinedGVCF} \
        -O ${sampleName}_rawVariants.vcf
  }
  output {
    File rawVCF = "${sampleName}_rawVariants.vcf"
  }
}
