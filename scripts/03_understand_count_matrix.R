# 03_understand_count_matrix.R
# Aim: understand what an RNA-seq count matrix looks like

# Load tidyverse for data handling
library(tidyverse)

# Create a small example count matrix
counts <- data.frame(
  gene = c("TP53", "BRCA1", "ESR1", "ERBB2", "GAPDH"),
  normal_1 = c(50, 80, 120, 30, 1000),
  normal_2 = c(55, 75, 110, 35, 980),
  tumour_1 = c(200, 30, 400, 300, 1020),
  tumour_2 = c(220, 25, 390, 280, 990)
)

# View the table
print(counts)

# Save the example count matrix
write.csv(counts, "data/example_count_matrix.csv", row.names = FALSE)