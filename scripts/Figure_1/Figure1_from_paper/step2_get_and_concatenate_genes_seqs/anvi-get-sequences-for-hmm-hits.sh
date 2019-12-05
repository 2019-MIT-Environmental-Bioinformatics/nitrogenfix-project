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
#SBATCH --output=anvi-get-sequences-for-hmm-hits.log # Standard output/error

#
module load anaconda/5.1
source activate anvio5

anvi-get-sequences-for-hmm-hits --external-genomes external-genomes2.txt \
                                -o concatenated-proteins.fa \
                                --hmm-source Campbell_et_al \
                                --gene-names Ribosomal_L1,Ribosomal_L2,Ribosomal_L3,Ribosomal_L4,Ribosomal_L5,Ribosomal_L6 \
                                --return-best-hit \
                                --get-aa-sequences \
                                --concatenate
#we created an TAB delimited external-genomes2.txt file matching the MAG databases to each corresponding -MAP.txt file
#We chose to use Campbell_et_al collection of HMM profiles and selected these listed single-copy core genes
#This produced a file with concatenated amino acid sequences for these genes 
