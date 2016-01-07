
# Set Working Directory
#setwd("~/projects/ncbi_ftp/")

# List files in a directory
files <- list.files(path="data", pattern=".genomic.fna.gz", full.names=TRUE)

# Loading seqinr package
library(seqinr)

# Reading sequence data into R
lna <- read.fasta(file = files[1], seqtype = c("DNA"))

cat("# How many sequences\n")
length(lna)

cat("# Length of sequences\n")
bp <- sapply(lna, length); summary(bp)

cat("# GC Content\n")
gc <- sapply(lna, GC); summary(gc)

# Get sequence annotations (FASTA headers)
annotation <- unlist(getAnnot(lna))

# Exporting Data
d.f <- data.frame(bp, gc, annotation)
write.csv(d.f, file="analysis/table.na.csv")

# Exploring Data Visually
pdf(file="analysis/plot.na.pdf")
par(mfrow=c(2,2))
hist(bp, main = "Histogram", xlab = "Length (bp)")
hist(gc, main = "Histogram", xlab = "GC%")
plot(bp, gc, xlab = "Length (bp)", ylab = "GC%")
dev.off()

# Indexing all elements that match pattern
i <- grep(pattern="Reclinomonas americana|Marchantia polymorpha|Hemiselmis andersenii|Mesostigma viride|Rhodomonas salina|Phytophthora infestans", x=getAnnot(lna), ignore.case=TRUE)

# Writing sequence data out as a FASTA file
write.fasta(sequences=lna[i], names=getName(lna[i]), file.out="analysis/sequence.fna")

# DNA words
cat("# Mononucleotide counts\n")
sapply(lna[i], table)
sapply(lna[i], count, 1)
cat("# Dinucleotide counts\n")
sapply(lna[i], count, 2)

# Print R version and packages
sessionInfo()
