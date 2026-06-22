#!/bin/bash

modality=$1
pheno=$2
chrom=$3
type=$4

mkdir -p /home/dnanexus/Genebased_Main/total/${type}

regenie \
  --step 2 \
  --chr ${chrom} \
  --remove /home/dnanexus/Data/titv_hethom_singleton.txt \
  --bed /home/dnanexus/Data/Image_Q1_c${chrom} \
  --phenoFile /home/dnanexus/Data/cov_${modality}.txt \
  --pred /home/dnanexus/Step1/${modality}/${modality}_result_pred.list \
  --anno-file /home/dnanexus/Anno_New/chr${chrom}/Main/${type}_chr${chrom}.txt \
  --set-list  /home/dnanexus/Anno_New/chr${chrom}/Main/chr${chrom}_${type}.setlist \
  --mask-def /home/dnanexus/Anno_New/Mask/Mask_${type}.txt \
  --aaf-bins 0.01 \
  --minMAC 1 \
  --vc-tests skato,acato-full \
  --vc-maxAAF 0.01 \
  --phenoColList ${pheno} \
  --write-mask \
  --write-mask-snplist \
  --qt \
  --apply-rint \
  --bsize 1000 \
  --threads 15 \
  --write-samples \
  --print-pheno \
  --rgc-gene-p \
  --out /home/dnanexus/Genebased_Main/total/${type}/total_c${chrom}_${type}
