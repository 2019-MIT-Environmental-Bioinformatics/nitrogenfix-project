#!/bin/bash
#SBATCH -p sched_mit_g4nier      
#SBATCH -N 1                          
#SBATCH -n 1            
#SBATCH --mem=10G                     
#SBATCH --time=3-00:00:00                
#SBATCH -J build_db            
#SBATCH --output=dbbuild_%a.out  
#SBATCH --error=dbbuild__%a.err
#SBATCH --mail-type=begin
#SBATCH --mail-type=end      
#SBATCH --mail-user=skoog@mit.edu 
#SBATCH --array=1-12


FILENAME=$(awk "NR==$SLURM_ARRAY_TASK_ID" genomes.txt)  #tells the system where to look for names iterating the process

module add engaging/ncbi-blast/2.6.0+  #loads BLAST into your working directory

makeblastdb -in $FILENAME -dbtype nucl -out $FILENAME  #makes each genome input into its own minature database for searching for proteins


#This batchfile is used to make protein databases out of genome files, for protein searches!

