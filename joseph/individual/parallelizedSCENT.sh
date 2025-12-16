#!/bin/bash
#SBATCH --job-name=SCENT
#SBATCH --array=1-10               # Job array range
#SBATCH --partition=big             # Equivalent of LSF queue
#SBATCH --mem=36G                   # 18 GB RAM
#SBATCH --cpus-per-task=6           # 6 cores
#SBATCH --output=Output_%A_%a.out   # %A = job ID, %a = array index
#SBATCH --error=Error_%A_%a.err
#SBATCH --time=12:00:00

module load CBI
module load r

num_cores=6
celltype="EN-Newborn"
group="Adolescence"
output_dir="/nowakowskilab/data1/Joseph/bmi_206/"

Rscript SCENT_parallelization.R \
    "${SLURM_ARRAY_TASK_ID}" \
    "${num_cores}" \
    "${celltype}" \
    "${group}" \
    "${output_dir}"