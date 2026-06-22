#!/bin/bash

modality=$1
pheno=$2

mkdir -p /home/dnanexus/Step1/${modality}_tmp/

regenie \
    --step 1 \
    --bed /home/dnanexus/ukb_cal_allChrs_hg38 \
    --extract /home/dnanexus/qc_pass.snplist \
    --remove /home/dnanexus/Data/titv_hethom_singleton.txt \
    --phenoFile /home/dnanexus/Data/cov_${modality}.txt \
    --phenoCol ${pheno} \
    --qt \
    --apply-rint \
    --bsize 1000 \
    --threads 30 \
    --lowmem \
    --lowmem-prefix /home/dnanexus/Step1/${modality}_tmp/${pheno}_total \
    --out /home/dnanexus/Step1/${modality}/total_${pheno}
