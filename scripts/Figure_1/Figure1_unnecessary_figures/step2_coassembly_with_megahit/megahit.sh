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
#SBATCH --output=megahit.log # Standard output/error

#
module load anaconda/5.1
source activate megahit

for SET in `cat sets.txt`
do
    megahit -1 $SET*-QUALITY_PASSED_R1.fastq \
            -2 $SET*-QUALITY_PASSED_R2.fastq \
            --min-contig-len 1000 \
            -o $SET-RAW.fa \
            --out-dir $SET-output-megahit
done
