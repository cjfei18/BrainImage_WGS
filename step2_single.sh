#!/bin/bash

modality=$1
pheno=$2
chrom=$3

regenie \
    --step 2 \
    --chr ${chrom} \
    --remove /home/dnanexus/Data/titv_hethom_singleton.txt \
    --bed /home/dnanexus/Data/Image_Q1_c${chrom} \
    --phenoFile /home/dnanexus/Data/cov_${modality}.txt \
    --pred /home/dnanexus/Step1/${modality}/${modality}_result_pred.list \
    --qt \
    --apply-rint \
    --minMAC 20 \
    --bsize 1000 \
    --phenoColList ${pheno} \
    --write-samples \
    --print-pheno \
    --out /home/dnanexus/Single/total/chr${chrom}
