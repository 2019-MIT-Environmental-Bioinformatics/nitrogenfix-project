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
#SBATCH --output=iqtree_nifD.log # Standard output/error

#
module load anaconda/5.1
source activate iqtree

iqtree -s output_clustalw_align_nifD_seqs -m MFP -mset WAG -alrt 1000 -bb 1000 -nt AUTO

#to create a phylogenetic tree
#calls IQ-Tree, tells it what your input alignment is (-s flag), then tells it to FIND the best model AND use this best model to build a tree (-m MFP)
#THEN, tells it ONLY to look for the best model within a SUBSET of available models--here WAG as the paper did. This will test all permutations of these (most-likely-best) models for the alignment.
#THEN, I asked for statistics...alrt is an SH-Approximate Likelihood Ratio Test, which tells you the proportion of times this bipartition improves likelihood of overall tree; -bb asks for "Ultrafast bootstraps," which is a shortcut bootstrap method. the numbers = replicates
#nt asks it to automatically find the best number of threads, and use that.
