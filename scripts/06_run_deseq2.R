# 06_run_deseq2.R
# Aim: perform differential gene expression analysis

# Load libraries
library(DESeq2)
library(tidyverse)

# Load count matrix
counts <- read.csv("data/example_count_matrix.csv")

# Set gene names as row names
rownames(counts) <- counts$gene

# Remove gene column
counts <- counts[, -1]

# Load metadata
metadata <- read.csv("data/example_metadata.csv")

# Set sample names as row names
rownames(metadata) <- metadata$sample

# Remove sample column but keep metadata as a data frame
metadata <- metadata[, -1, drop = FALSE]

# View counts
print(counts)

# View metadata
print(metadata)

# Create DESeq2 dataset
dds <- DESeqDataSetFromMatrix(
  countData = counts,
  colData = metadata,
  design = ~ condition
)

# Estimate size factors for normalisation
dds <- estimateSizeFactors(dds)

# Estimate gene-wise dispersion
dds <- estimateDispersionsGeneEst(dds)

# Use gene-wise dispersion estimates directly
dispersions(dds) <- mcols(dds)$dispGeneEst

# Run statistical testing
dds <- nbinomWaldTest(dds)

# Extract results
results_table <- results(dds)

# View results
print(results_table)

# Save results
write.csv(
  as.data.frame(results_table),
  "results/deseq2_results.csv"
)