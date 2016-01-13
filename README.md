----------

Haruo Suzuki  
Last Update: 2016-01-08  

----------

# NCBI Genomes FTP Project
Project started 2015-12-21.  

DNA and protein sequences for plasmid, plastid, mitochondrion, and viral genomes were retrieved from the NCBI FTP site.
Analyses of the sequence data were performed using the R SeqinR package.

## Project directories

    ncbi_ftp/
     README.md: project documentation
     data/: contains sequence data in FASTA format
     scripts/: contains R and Shell scripts
     analysis/: contains results of data analyses

## Data

FASTA format sequences of Nucleic Acids (`.fna.gz`) and Amino Acids (`.faa.gz`) for plasmid, plastid, mitochondrion, and viral genomes were downloaded on 2015-12-18 from <ftp://ftp.ncbi.nlm.nih.gov/refseq/release> into `data/`, using:  

    wget -b -P data/ ftp://ftp.ncbi.nlm.nih.gov/refseq/release/{mitochondrion,plasmid,plastid,viral}/{*.faa.gz,*.fna.gz}
    # Downloaded: 15 files, 367M in 4m 45s (1.29 MB/s)

## Scripts

The shell script `scripts/run.sh` automatically carries out the entire steps: creating directories, downloading data, inspecting data, and running R scripts for analyzing FASTA format sequences of Nucleic Acids (`scripts/my_fna.R`) and Amino Acids (`scripts/my_faa.R`).

## Usage

In the project's main directory `ncbi_ftp/`, we run the shell script `scripts/run.sh` with:

    bash scripts/run.sh > log.txt 2>&1 &

----------

## References
- [Genomes Download FAQ | 7. How are the new FTP directories structured?](http://www.ncbi.nlm.nih.gov/genome/doc/ftpfaq/#structure)
 - refseq: content includes assembled genome sequence and RefSeq annotation data.
  - viral, mitochondrion, plasmid, plastid [Content is from the RefSeq release FTP site.](ftp://ftp.ncbi.nlm.nih.gov/refseq/release/README)

----------
