cat("\n  This R script analyzes FASTA format sequences of Amino Acids (`.faa.gz`).\n\n")

# Set Working Directory
#setwd("~/projects/ncbi_ftp/")

# List files in a directory
files <- list.files(path="data", pattern=".protein.faa.gz", full.names=TRUE)

# Loading seqinr package
library(seqinr)

# Reading sequence data into R
laa <- read.fasta(file = files[1], seqtype = c("AA"))

cat("# How many sequences\n")
length(laa)

cat("# Length of sequences\n")
sapply(laa, length)[1:10]

# $length $composition
unlist(summary(laa[[5]]))

cat("# Protein sequence information\n")
pdf(file="analysis/plot.aa.pdf")
AAstat(laa[[5]], plot = TRUE)
dev.off()

cat("# Get sequence annotations (FASTA headers)\n")
getAnnot(laa[1:2])

# Indexing all elements that match pattern
i <- grep(pattern="Reclinomonas americana", x=getAnnot(laa), ignore.case=TRUE)

# Writing sequence data out as a FASTA file
write.fasta(sequences=laa[i], names=getName(laa[i]), file.out="analysis/sequence.faa")

# Exporting Data
 aau <- sapply(laa[i], function(x) AAstat(x, plot=FALSE)$Compo ) # absolute frequencies
#aau <- sapply(laa[i], function(x) summary(x)$composition ) # relative frequencies
#aau <- sapply(laa[i], function(x) unlist(summary(x)) )
write.csv(t(aau), file="analysis/table.aa.csv")

# Print R version and packages
sessionInfo()
