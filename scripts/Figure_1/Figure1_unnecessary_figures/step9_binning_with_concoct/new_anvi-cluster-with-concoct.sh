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
#SBATCH --output=new_anvi-cluster-with-concoct.log # Standard output/error

#
module load anaconda/5.1
source activate anvio5

for SET in `cat sets4.txt`
do
    anvi-cluster-with-concoct -c new_$SET-CONTIGS.db \
                              -p new_$SET-MERGED/PROFILE.db \
                              --num-clusters 100 \
                              -C CONCOCT
done
