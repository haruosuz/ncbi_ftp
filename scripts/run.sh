#!/bin/bash
set -euo pipefail

# Creating directories
mkdir -p ./{data/$(date +%F),analysis/$(date +%F)}

# Downloading data
wget -P data/ ftp://ftp.ncbi.nlm.nih.gov/refseq/release/mitochondrion/{*.faa.gz,*.fna.gz}
#wget -P data/ ftp://ftp.ncbi.nlm.nih.gov/refseq/release/{mitochondrion,plasmid,plastid,viral}/{*.faa.gz,*.fna.gz}

# Inspecting Data
ls -lh data/*.gz
zgrep -c '^>' data/*.gz
zgrep '^>' data/mitochondrion.1.1.genomic.fna.gz > analysis/header.genomic.fna.txt
zgrep '^>' data/mitochondrion.1.protein.faa.gz > analysis/header.protein.faa.txt

# Running R scripts
Rscript --vanilla scripts/my_fna.R
Rscript --vanilla scripts/my_faa.R

# Print operating system characteristics
uname -a

echo "[$(date)] Thank you, come again."
