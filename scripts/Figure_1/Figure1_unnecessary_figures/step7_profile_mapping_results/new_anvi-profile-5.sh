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
#SBATCH --output=new_anvi-profile-5.log # Standard output/error

#
module load anaconda/5.1
source activate anvio5

for sample in `awk '{print $1}' samples5.txt`
do
    if [ "$sample" == "sample" ]; then continue; fi

    # determine which metagenomic set the $sample belongs to:
    SET=`echo $sample | awk 'BEGIN {FS="_"}{print $1}'`

    anvi-profile -c new_$SET-CONTIGS.db \
                 -i new_$sample.bam \
                 --skip-SNV-profiling \
                 --num-threads 16 \
                 -o new_$sample

done
