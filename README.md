# BMI206-Statistical-Methods-Group-Project

## Project Overview
This repository contains the code, data, and results for our **BMI206 Statistical Methods Group Project** at UCSF.  
Our group is reanalyzing data from the paper:

> **Tissue-specific enhancer–gene maps from multimodal single-cell data identify causal disease alleles**  
> *Saori Sakaue et al.*, *Nature Genetics* (2023)

This study integrates multimodal single-cell data to build tissue-specific enhancer–gene maps and link them to causal alleles underlying complex diseases. Our goal is to **replicate and extend one of the key analyses** from the paper using the statistical and computational tools learned in BMI206.

---

## Set-Up Python Environment

```
python3.11 -m venv BMI206-Env

source BMI206-Env/bin/activate

pip install --upgrade pip

# data analysis, visualization, and notebook tools:
pip install numpy pandas matplotlib seaborn scipy scikit-learn
pip install scanpy statsmodels anndata

pip install jupyter ipykernel

# Add this environment to Jupyter
python -m ipykernel install --user --name=BMI206-Env --display-name "Python (BMI206-Env)"

```

## Push to the repo

```

git add .


git commit -m "Add project README"


git push origin main

```



## Objectives **PLS add objectives from Assignment #2**
- Reproduce a subset of analyses from the Sakaue *et al.* paper.  

- Explore enhancer–gene link inference across tissues using statistical models.  

- Document challenges, methodological choices, and key lessons learned.

---

## Background
Enhancer–gene maps are crucial for understanding how noncoding genetic variation influences gene regulation and disease.  
Sakaue *et al.* combined **chromatin accessibility**, **gene expression**, and **GWAS summary statistics** to identify putative causal enhancer–gene relationships across tissues.  


---

## Methods
We will use a combination of:
- **Single-cell multiomics datasets** from the original publication (downloaded from GEO)
- **Statistical modeling techniques** covered in BMI206:
  - ? 
  - ?
  - ?
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

- **Evaluation:** Based on approach, interpretation, and participation during Q&A  

---

## Team Members
- Juan Carlos Gomez  
- Sara
- Izabella
- Joseph 

---

## Repository Structure
