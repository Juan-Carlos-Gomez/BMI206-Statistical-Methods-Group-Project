# BMI206-Statistical-Methods-Group-Project

## Project Overview
This repository contains the code, data, and results for our **BMI206 Statistical Methods Group Project** at UCSF.  
Our group is reanalyzing data from the paper:

> **Tissue-specific enhancer–gene maps from multimodal single-cell data identify causal disease alleles**  
> *Saori Sakaue et al.*, *Nature Genetics* (2023)

This study integrates multimodal single-cell data to build tissue-specific enhancer–gene maps and link them to causal alleles underlying complex diseases. Our goal is to **replicate and extend one of the key analyses** from the paper using the statistical and computational tools learned in BMI206.

---

## 🎯 Objectives
- Reproduce a subset of analyses from the Sakaue *et al.* paper.  
- Explore enhancer–gene link inference across tissues using statistical models.  
- Evaluate disease-associated loci (e.g., rheumatoid arthritis, lupus) for enrichment in identified enhancer–gene pairs.  
- Apply regression, correlation, and dimensionality reduction techniques from the course to validate or extend findings.  
- Document challenges, methodological choices, and key lessons learned.

---

## Background
Enhancer–gene maps are crucial for understanding how noncoding genetic variation influences gene regulation and disease.  
Sakaue *et al.* combined **chromatin accessibility**, **gene expression**, and **GWAS summary statistics** to identify putative causal enhancer–gene relationships across tissues.  
Our reanalysis focuses on a subset of tissues and aims to evaluate the **statistical robustness** of enhancer–gene associations using alternative modeling approaches.

---

## Methods
We will use a combination of:
- **Single-cell multiomics datasets** from the original publication (downloaded from GEO)
- **Statistical modeling techniques** covered in BMI206:
  - Linear regression and multiple regression  
  - Correlation analysis and PCA  
  - Hypothesis testing and permutation-based significance assessment
- **Tools:** Python (`pandas`, `scanpy`, `statsmodels`) and R (`tidyverse`, `ggplot2`, `Seurat`)

---

## Deliverables
- **Code notebooks:** Data preprocessing, statistical reanalysis, visualization  
- **Slides:** Summarizing approach, key findings, and challenges  
- **Figures:** Replicated or reinterpreted plots based on the Sakaue *et al.* dataset  
- **README:** Documentation of workflow and analysis plan  

---

## Presentation
- **Due:** November 24–26, 2025  
- **Format:** Oral presentation (one per group)  
- **Evaluation:** Based on approach, interpretation, and participation during Q&A  

---

## Team Members
- Juan Carlos Gomez  
- Sara
- Izabella
- Joseph 

---

## Repository Structure
