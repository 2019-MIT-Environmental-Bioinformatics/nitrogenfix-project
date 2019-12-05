#!/bin/bash
#SBATCH --partition=compute # Queue selection
#SBATCH --job-bowtie2build # Job name
#SBATCH --mail-type=ALL # Mail events (BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=skoog@mit.edu # Where to send mail
#SBATCH --ntasks=1 # Run on one CPU
#SBATCH --nodes=1
#SBATCH --cpus-per-task=36
#SBATCH --mem=180gb # Job memory request
#SBATCH --time=1-00:00:00 # Time limit hrs:min:sec
#SBATCH --output=anvi-gen-phylogenomic-tree.log # Standard output/error

#
module load anaconda/5.1
source activate anvio5

anvi-gen-phylogenomic-tree -f concatenated-proteins.fa \
                           -o phylogenomic-tree.txt

#we used the outputted concatenated-proteins.fa and generated a phylogenomic tree
#this outputted a phylogenomic-tree.txt which we do not have anymore because it was deleted on accident
