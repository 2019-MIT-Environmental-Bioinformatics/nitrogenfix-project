#!/bin/bash
#SBATCH -p sched_mit_g4nier      
#SBATCH -N 1                          
#SBATCH -n 1            
#SBATCH --mem=10G                     
#SBATCH --time=4-00:00:00                
#SBATCH -J blasts              
#SBATCH --output=blasts_%a.out     
#SBATCH --error=blasts__%a.err      
#SBATCH --mail-user=skoog@mit.edu  
#SBATCH --array=1-12

module add engaging/ncbi-blast/2.6.0+
#I used the MIT engaging cluster because they already had ncbi-blast and to reduce my queue time in poseidon

FILENAME=$(awk "NR==$SLURM_ARRAY_TASK_ID" genomes.txt) #MAKE THIS TEXTFILE THAT JUST LISTS THE FILENAMES OF YOUR DATABASES

tblastn -query NifD_protein_query.fa -db $FILENAME -out $FILENAME+"hits"
#Asks BLAST to search through each of the genome databases for that given protein query, and output the hits as "hit"-labeled files
#outputs but also tab-delineated format and ADDS a taxID, in case you want to backreference that for taxonomy later



