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
#SBATCH --output=samtools_1.log # Standard output/error

#
module load anaconda/5.1
source activate samtools

for sample in `awk '{print $1}' samples1.txt`
do
    if [ "$sample" == "sample" ]; then continue; fi

    # covert the resulting SAM file to a BAM file:
    samtools view -F 4 -bS new_$sample.sam > new_$sample-RAW.bam

    # sort and index the BAM file:
    samtools sort new_$sample-RAW.bam -o new_$sample.bam
    samtools index new_$sample.bam

    # remove temporary files:
    rm new_$sample.sam new_$sample-RAW.bam
done
