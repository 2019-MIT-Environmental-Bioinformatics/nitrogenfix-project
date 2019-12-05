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
#SBATCH --output=iu-filter-quality-minoche10.log # Standard output/error

#
module load anaconda/5.1
source activate illumina-utils

for sample in `awk '{print $1}' samples10.txt`
do
    if [ "$sample" == "sample" ]; then continue; fi
    iu-filter-quality-minoche $sample.ini --ignore-deflines
done
