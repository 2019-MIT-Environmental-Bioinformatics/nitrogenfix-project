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
#SBATCH --output=anvi-interactive.log # Standard output/error

#
module load anaconda/5.1
source activate anvio5

anvi-interactive -p phylogenomic-profile.db \
                 -t phylogenomic-tree.txt \
                 -d phylogeny4.txt \
                 --title "Phylogenomics Tutorial Example #1" \
                 --manual



#We created an TAB delimited phylogeny4.txt file from the supplementary data Table 3 from the paper which contained the genomes, the length of the genomes, and the pylogeny of the genomes, phyla and class specifically. 
#This was overlayed on the phylogenomic tree in anvi-interactive in order to supply information about phylogeny and the length of the genomes
#This was not run as a batch file. This script is what we used after creating an SSH tunnel in order to view it in a browser
