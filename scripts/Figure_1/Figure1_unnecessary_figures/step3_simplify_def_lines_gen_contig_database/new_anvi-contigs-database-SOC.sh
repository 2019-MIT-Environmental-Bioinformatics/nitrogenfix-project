#!/bin/bash
#SBATCH --partition=compute # Queue selection
#SBATCH --job-anvi-contigs-database # Job name
#SBATCH --mail-type=ALL # Mail events (BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=skoog@mit.edu # Where to send mail
#SBATCH --ntasks=1 # Run on one CPU
#SBATCH --nodes=1
#SBATCH --cpus-per-task=36
#SBATCH --mem=180gb # Job memory request
#SBATCH --time=1-00:00:00 # Time limit hrs:min:sec
#SBATCH --output=new_anvi-contigs-database-SOC.log # Standard output/error

#
module load anaconda/5.1
source activate anvio5

anvi-script-reformat-fasta SOC-RAW.fa -l 5000 --simplify-names -o new_SOC.fa
anvi-gen-contigs-database -f new_SOC.fa -o new_SOC-CONTIGS.db

