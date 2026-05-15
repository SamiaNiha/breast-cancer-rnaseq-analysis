# 05_check_data_matching.R
# Aim: check that count matrix samples match metadata samples

library(tidyverse)

# Load count matrix and metadata
counts <- read.csv("data/example_count_matrix.csv")
metadata <- read.csv("data/example_metadata.csv")

# View column names in the count matrix
count_sample_names <- colnames(counts)[-1]

# View sample names in metadata
metadata_sample_names <- metadata$sample

# Print both
print(count_sample_names)
print(metadata_sample_names)

# Check if they match
all(count_sample_names == metadata_sample_names)