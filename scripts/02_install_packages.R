# 02_install_packages.R
# Install packages needed for this project

# CRAN packages
install.packages("tidyverse")
install.packages("pheatmap")
install.packages("BiocManager")

# Bioconductor packages
BiocManager::install("DESeq2")
BiocManager::install("EnhancedVolcano")
BiocManager::install("clusterProfiler")
BiocManager::install("org.Hs.eg.db")

library(tidyverse)
library(pheatmap)
library(BiocManager)
library(DESeq2)