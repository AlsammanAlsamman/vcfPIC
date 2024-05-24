# vcfPIC R Package

## Overview
The **PIC Calculator** R package is designed to calculate Polymorphism Information Content (PIC) values for Single Nucleotide Polymorphisms (SNPs) from a VCF (Variant Call Format) , HapMap (Haplotype Map) or Genetic Binary Table file. PIC values provide a measure of the informativeness of genetic markers for linkage and association studies.
```math
PIC = 1 - \sum_{i=1}^{n} P_{ij}^2 
```
where \(P_{ij}\) is the frequency of the \(j^{th}\) allele for the \(i^{th}\) SNP, and \(n\) is the number of alleles for the SNP.

## Features
- **Calculate PIC Values**: Compute PIC values for each SNP in a given VCF / HapMap / Genetic Binary Table file.
- **Efficient Processing**: Handle large files efficiently using optimized R functions coded using C.
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
### Calculate PIC from different file formats
#### from HapMap file
```R
PIC.hapmap <- calculatePIC("data/sheep_genotypes.hmp", "hapmap")
head(PIC.hapmap)
```
#### from VCF file
```R
PIC.vcf <- calculatePIC("data/sheep_genotypes.vcf", "vcf")
head(PIC.vcf)
```

#### from Genetic Binary Table file
The Genetic Binary Table file is a tab-delimited text file with the following format:
```markdown
| rs  | alleles | chr | pos | sample1 | sample2 | sample3 | sample4 | sample5 | sample6 | sample7 |
|-----|---------|-----|-----|---------|---------|---------|---------|---------|---------|---------|
| rs1 | A/T     | 1   | 100 | 2       | 0       | 1       | 1       | -1      | 1       | 0       |
| rs2 | C/G     | 1   | 200 | 0       | 2       | 0       | 1       | 2       | 0       | 1       |
| rs3 | A/C     | 1   | 300 | 2       | 0       | 1       | 0       | 1       | 2       | 0       |
```




### Calculate PIC step by step

```R
library(vcfPIC)


###### VCF

# Step 1: Read the VCF data
vcfData <- readVCF("data/sheep_genotypes.vcf")
head(vcfData)

# Step 2: Calculate allele frequencies from VCF data
freqVCF <- calculateAlleleFreqVCF(vcfData)
head(freqVCF)

# Step 3: Calculate PIC from allele frequencies of VCF data
PIC.vcf <- calculatePICByFreq(freqVCF)
head(PIC.vcf)

###### HapMap
# Step 1: Read the HapMap data
hapmapData <- readHapmap("data/sheep_genotypes.hmp")

# Step 1: Convert HapMap genotypes to binary numeric format
hapmapData.Binary <- convertGenoBi2Numeric(hapmapData)
head(hapmapData.Binary)

# Step 2: Calculate PIC directly from a VCF file
PIC <- calculatePIC("data/sheep_genotypes.vcf", "vcf")
head(PIC)

###### Binary
# Step 1: Read the binary genetic data
binaryData <- readGeneticBinaryTable("data/sheep_genotypes_binary.tsv", header=TRUE, sep="\t")
head(binaryData)

# Step 2: Calculate allele frequencies from binary data
TableBinarFreq <- calculateAlleleFreqBinary(binaryData)
head(TableBinarFreq)

# Step 3: Calculate PIC from allele frequencies of binary data
PIC.vcf <- calculatePICByFreq(TableBinarFreq)
head(PIC.vcf)

```

## Contact

For any questions or inquiries, please contact Alsamman at smahmoud[useAandT]ageri.sci.eg.

