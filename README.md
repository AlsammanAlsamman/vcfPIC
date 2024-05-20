
# vcfPIC R Package

# UNDER DEVELOPMENT


## Overview
The **PIC Calculator** R package is designed to calculate Polymorphism Information Content (PIC) values for Single Nucleotide Polymorphisms (SNPs) from a VCF (Variant Call Format) file. PIC values provide a measure of the informativeness of genetic markers for linkage and association studies.
```math
PIC = 1 - \sum_{i=1}^{n} P_{ij}^2 
```
where \(P_{ij}\) is the frequency of the \(j^{th}\) allele for the \(i^{th}\) SNP, and \(n\) is the number of alleles for the SNP.

## Features
- **Calculate PIC Values**: Compute PIC values for each SNP in a given VCF file.
- **Efficient Processing**: Handle large VCF files efficiently using optimized R functions.
- **Easy Integration**: Seamlessly integrate with other bioinformatics tools and pipelines in R.

## Installation

You can install the package directly from GitHub using the `devtools` package:

```R
# Install devtools if you haven't already
install.packages("devtools")

# Install the PIC Calculator package from GitHub
devtools::install_github("AlsammanAlsamman/vcfPIC")
```

## Usage

### Load the Package

```R
library(vcfPIC)
```

### Calculate PIC from a VCF File

```R
# Define the path to your VCF file
vcf_file <- "path/to/your/vcf_file.vcf"

# Calculate PIC values for the SNPs in the VCF file
pic_values <- calculatePIC(vcf_file)

# Print the PIC values
print(pic_values)
```

### Example

```R
# Example VCF file provided in the package
vcf_file <- system.file("extdata", "example.vcf", package = "picCalculator")

# Calculate PIC values
pic_values <- calculatePIC(vcf_file)

# Print the PIC values
print(pic_values)
```

## Functions

### calculatePIC

- **Description**: Calculate PIC values for SNPs in a VCF file.
- **Usage**:
  ```R
  calculatePIC(vcf_file)
  ```
- **Arguments**:
  - `vcf_file`: A character string specifying the path to the VCF file.
- **Returns**: A data frame with PIC values for each SNP.




## Acknowledgements

This package was developed with support from [Your Institution/Organization]. Special thanks to all contributors and users.

## Contact

For any questions or inquiries, please contact Alsamman at smahmoud[useAandT]ageri.sci.eg.

