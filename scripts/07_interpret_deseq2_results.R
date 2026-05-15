# 07_interpret_deseq2_results.R
# Aim: inspect and interpret DESeq2 results

library(tidyverse)

# Load DESeq2 results
results <- read.csv("results/deseq2_results.csv")

# View results
print(results)

# Rename first column to gene
colnames(results)[1] <- "gene"

# Arrange genes by adjusted p-value
results_sorted <- results %>%
  arrange(padj)

print(results_sorted)

# Add interpretation column
results_interpreted <- results_sorted %>%
  mutate(
    regulation = case_when(
      log2FoldChange > 1 ~ "Upregulated in tumour",
      log2FoldChange < -1 ~ "Downregulated in tumour",
      TRUE ~ "No large change"
    )
  )

print(results_interpreted)

# Save interpreted results
write.csv(
  results_interpreted,
  "results/deseq2_results_interpreted.csv",
  row.names = FALSE
)