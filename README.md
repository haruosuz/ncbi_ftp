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

    #wget -b -P data/ ftp://ftp.ncbi.nlm.nih.gov/refseq/release/mitochondrion/{*.faa.gz,*.fna.gz}
    wget -b -P data/ ftp://ftp.ncbi.nlm.nih.gov/refseq/release/{mitochondrion,plasmid,plastid,viral}/{*.faa.gz,*.fna.gz}
    # Downloaded: 15 files, 367M in 4m 45s (1.29 MB/s)

## Scripts

The shell script `scripts/run.sh` automatically carries out the entire steps: creating subdirectories, downloading data, inspecting data, and running R scripts for analyzing FASTA format sequences of Nucleic Acids (`scripts/my_fna.R`) and Amino Acids (`scripts/my_faa.R`).

## Usage

In the `ncbi_ftp/` directory, we run the shell script `scripts/run.sh` with:

    bash scripts/run.sh > log.txt 2>&1 &

----------

## References
- [Genomes Download FAQ | 7. How are the new FTP directories structured?](http://www.ncbi.nlm.nih.gov/genome/doc/ftpfaq/#structure)
 - refseq: content includes assembled genome sequence and RefSeq annotation data.
  - viral, mitochondrion, plasmid, plastid [Content is from the RefSeq release FTP site.](ftp://ftp.ncbi.nlm.nih.gov/refseq/release/README)

- [An integrated phylogenomic approach toward pinpointing the origin of mitochondria.](http://www.ncbi.nlm.nih.gov/pubmed/25609566)
 - 'The 6 mitochondrial representatives (Reclinomonas americana, Marchantia polymorpha, Hemiselmis andersenii, Mesostigma viride, Rhodomonas salina and Phytophthora infestans) were selected because they were primitive, gene rich and represented a broad range of phylogenetic diversities.'

- [SeqinR](http://pbil.univ-lyon1.fr/software/seqinr/home?lang=eng)
 - [Using the R SeqinR package](http://davetang.org/muse/2013/05/09/using-the-r-seqinr-package/)
 - [Welcome to a Little Book of R for Bioinformatics!](http://a-little-book-of-r-for-bioinformatics.readthedocs.org/en/latest/index.html)
 - [Applied Statistics for Bioinformatics using R](https://cran.r-project.org/doc/contrib/Krijnen-IntroBioInfStatistics.pdf)

----------
