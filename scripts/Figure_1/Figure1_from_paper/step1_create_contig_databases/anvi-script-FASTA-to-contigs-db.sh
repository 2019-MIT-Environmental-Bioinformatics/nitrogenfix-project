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
#SBATCH --output=anvi-script-FASTA-to-contigs-db.log # Standard output/error

#
module load anaconda/5.1
source activate anvio5

for i in *fa
do
	anvi-script-FASTA-to-contigs-db $i
done

#creates MAP.txt and databases for each non-redundant MAG. The output was deleted on accident, but it comtained 958 non-redundant MAG databases and -MAP.txt files for each .fa file.
