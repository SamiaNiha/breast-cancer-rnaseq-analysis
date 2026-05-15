# 01_project_setup.R
# Breast cancer RNA-seq analysis project
# Aim: prepare the R environment for the analysis

# Print a message to confirm the script runs
print("Project setup script is running")

# Check the current working directory
getwd()

# Create a small example gene list
genes <- c("TP53", "BRCA1", "ESR1", "ERBB2")

# Print the gene list
print(genes)
