#!/bin/bash

vcf=$1
pop1=$2
pop2=$3

# Pairwise Weir & Cockerham Fst
vcftools \
    --gzvcf "${vcf}" \
    --weir-fst-pop "${pop1}" \
    --weir-fst-pop "${pop2}" \
    --out "${pop1}_vs_${pop2}"


# Pi for population 1
vcftools \
    --gzvcf "${vcf}" \
    --keep "${pop1}" \
    --window-pi 100000 \
    --window-pi-step 10000 \
    --out "${pop1}.pi"

# Pi for population 2
vcftools \
    --gzvcf "${vcf}" \
    --keep "${pop2}" \
    --window-pi 100000 \
    --window-pi-step 10000 \
    --out "${pop2}.pi"


  
