#!/bin/bash
set -e
set -u
set -o pipefail

# Creating directories
mkdir -p ./{data/$(date +%F),analysis/}

# Downloading data
wget -nv -P data/ ftp://ftp.ncbi.nlm.nih.gov/refseq/release/{mitochondrion,plasmid,plastid,viral}/{*.faa.gz,*.fna.gz}
#wget -P data/ ftp://ftp.ncbi.nlm.nih.gov/refseq/release/mitochondrion/{*.faa.gz,*.fna.gz}

# Inspecting Data
ls -lh data/*.gz
zgrep -c '^>' data/*.gz

# Running R scripts
Rscript --vanilla scripts/my_fna.R
#Rscript --vanilla scripts/my_faa.R

# Print operating system characteristics
uname -a

echo "[$(date)] $0 has been successfully completed."
