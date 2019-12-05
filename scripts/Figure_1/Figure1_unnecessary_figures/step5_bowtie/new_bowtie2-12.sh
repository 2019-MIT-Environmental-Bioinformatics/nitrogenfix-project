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
#SBATCH --output=new_bowtie2-12.log # Standard output/error

#
module load anaconda/5.1
source activate bowtie2

for sample in `awk '{print $1}' samples12.txt`
do
    if [ "$sample" == "sample" ]; then continue; fi

    # determine which metagenomic set the $sample belongs to:
    SET=`echo $sample | awk 'BEGIN {FS="_"}{print $1}'`

    # do the bowtie mapping to get the SAM file:
    bowtie2 --threads 20 \
            -x new_$SET \
            -1 ../NON_REDUNDANT_MAGs_backup_with_fastqgz/$sample-QUALITY_PASSED_R1.fastq \
            -2 ../NON_REDUNDANT_MAGs_backup_with_fastqgz/$sample-QUALITY_PASSED_R2.fastq \
            --no-unal \
            -S new_$sample.sam
done
