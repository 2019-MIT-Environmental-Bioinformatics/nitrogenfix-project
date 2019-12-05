Diana Dumit and Emilie Skoog

# Paper title: Nitrogen-fixing populations of Planctomycetes and Proteobacteria are abundant in the surface ocean metagenomes.

Delmont, T. O., Quince, C., Shaiber, A., Esen, Ö. C., Lee, S. T. M., Rappé, M. S., McLellan, S. L., Lücker, S., and Eren, A. M.

## Proposed reanalysis:

This paper dives into the TARA Oceans meta-data and recovers several different non-redundant MAGS from nitrogen fixing non-cyanobacteria. They analyzed 93 TARA Oceans metagemones from 61 surface samples and 32 samples from the deep chlorophyll maximum layer of the water column. Samples were taken from the Pacific, Indian, Southern, andAtlantic oceans as well as the Mediterranean and Red sea. They create phylogenomic trees with overlaid metadata using A’nvio as well as functional network diagram, represented in figure one. We aim to recreate figure one (the phylogenomic tree and functional network), as well as figure two (the phylogenetic tree for the nifD and nifH genes), and lastly the bottom panel of figure three (a map displaying the niche partitioning of the different diazotrophic microbes on the surface oceans).

## Files and Directories

### Jupyter-Notebooks

Inside this directory are two jupyter notebooks:
	1. Bubble_map.ipynb
		Bubble_map.ipynb contains the python code needed to make the third figure. All of the data from that code can be found in data/fig3.
	2. Final-comparison.ipynb
		final-comparison.ipynb describes the results obtained from this project and its comparisons to the published figures.

### Envs

#### Inside this directory the .yaml files for the conda environments used in this project.
	1. TOSU.yml:
		This environment was created and used to make figure 3. The name "TOSU" stands for The Ohio State University. It was created in a time where my python code wasn't working and my environments kept giving me errors. Finally, this was the one that worked.
	2. iluminia-utils.yml:
		For quality filtering of raw reads, we used ilumina-utils to produce configuration files from the samples.txt which generated .ini files. These were then quality filtered.
	3. megahit.yml:
		Environment used for megahit in order to coassemble each metagenomic dataset.
	4. anvio5.yml:
		We used anvio5 to simplify deflines for the FASTA files, generate contig databases for each metagenomic set, identify CORE genes, import taxanomy, process BAM files, merge profiles and bin MAGS. We also used it to ultimately visualize our data.
	5. anvio-6.yml:
		Originally we proposed to analyze and reproduce figures using the latest ANVIO. However, when it came to automated binnnig with concoct, we learned that ANVIO 6 is no longer compatible with concoct, so we couldn't get to the last step and visualize our data. Therefore we resorted to using anvio-5. We tried importing anvio-6 databases into anvio-5 and then binning with concoct, but the database created with anvio-6 was incompatible with anvio-5.
	6. bowtie2.yml:
		We used bowtie2 to map shortreads from the metagenomes onto the scaffolds.
	7. samtools.yml:
		We created BAM files from the SAM files created by bowtie2. There were sorted and indexed by samtools.
	8. clustalw.yml:
		This env was used to align the nifD and nifH genes in each protein extracted from NCBI. 
	9. iqtree.yml:
		This environment was used to infer the phylogenetic trees by maximum likelihood, using the WAG model as the paper did.
	10. kaiju.yml:
		Initially kaiju was used for taxonomic classification of the MAGS.

### Data

1. Figure 1
	1. Figure1_from_paper
		Inside this folder all the fasta files from the TARA oceans project used can be found. The .txt files (phylogeny4.txt and external-genomes2.txt) are files utilized in the ANVIO pipeline, they are commented in the scripts folder.
	2. Figure1_unnecessary_figure
		Data for this figure can be found in trash/data/fig1 it will be all the folders in here.
2. Figure 2
	1. Step 1 Build Database
		Contains the genome.txt file and the MAGS FASTA file for the different ocean environments.
	2. Step 1 Results from Building Database
		Contains the results from the build database command. These results will be used downstream.
	3. Step 2 for Blasting Proteins in MAGS
		Contains the fasta files for the nifH and nifD proteins
	4. Step 2 Results from Blasting
		Results from blasting the nifH and nifD proteins in the MAGS
	5. Step 3 Align
		Data for aligning the nifH and nifD sequences
	6. Step 4 Results Tree
		Final phylogenetic tree images, contains our results and those from the authors.
3. Figure 3
	This folder contains the .csv file obtained from the Meren website. In this file the HBD data and latitude, longitude are found. From this folder the .png files were created using the jupyter notebook code found in (Bubble_map.ipynb). Comparison2.png and comparison1.png 

### Logs
Logs were deleted after tryinig to reset our git push. However, this is what they would look like if they still existed.
1. Figure 1
	1. Figure1_from_paper
		1. Step1
			-anvi-script-FASTA-to-contigs-db.log
				Log file for the first step in the anvio pipeline.	
		2. Step2
			-anvi-get-sequences-for-hmm-hits.log
				Log file for the second step in the anvio pipeline.
		3. Step3
			-anvi-gen-phylogenomic-tree.log
				Log file for the second to last step to create the phylogenomic tree.
		4. Step4
			-anvi-interactive.log
				Log file to visualize tree
	2. Figure1_unnecessary_figures
		Log files for the ANVIO6 pipeline.
2. Figure 2
	1. Step 1 Make Database
		Log file for the first step of building the phylogenetic tree. 
	2. Step 2 Blast for Proteins in MAGS
		Blast log file for MAGS from each ocean environment.
	3. Step 3 Align
		Log file for the nifD nifH alignment.
	4. Step 4 Build Tree
		Final log file for building the phylogenetic tree.

### Scripts

1. Figure 1
	a. Figure1_from_paper
		Step1
			-anvi-script-FASTA-to-contigs-db.sh
				Generates a contigs databases from the fasta files of the MAGS. This step is needed to reporoduce fig1.
		Step2
			-anvi-get-sequences-for-hmm-hits.sh
				Utilizes an HMM profile to concatenate genes of interest.
		Step3
			-anvi-gen-phylogenomic-tree.sh
				Creates a newick tree to show the relationshps between the genes of interest.
		Step4
			-anvi-interactive.sh
				Script to visualize phylogenomic tree.
	b. Figure1_unnecessary_figures
		All scripts in this directory were used for ANVIO6 to recreate figure 1. We had to resort to using ANVIO5 because concoct was not compatible with the latest anvio version. Therefore these figures aren't the ones we officially use for our comparison.
2. Figure 2
	1. Step 1 Make Database
		Slurm script for building the database for the genes of interest (nifD, nifH). Scripts are well commented.
	2. Step 2 Blast for Proteins in MAGS
		Slurm script blasts for the nifD and nifH protein sequences in the MAGS for the different ocean environments. Scripts in this folder are well commented and easy to follow.
	1. Step 3 Align
		Script for aligning the FASTA amino acid sequences taken from the NCBi database and the HBDs.
	2. Step 4 Create Tree
		Script for both the nifD and nifH phylogenetic tree.

### Output
#### All output files were deleted when the git catastrophe occur. They can be found in the recovered folder

1. Figure 1
	1. Figure1_from_paper
		1. Step 1
			Outputs for the first command where a contigs database was created from the MAG files.
		2. Step 2
			Output for HMM hits for the nifH and nifD genes
		3. Step 3
			Output for the phylogenomic tree created.
		4. Step 4
			File used to view the phylogenomic tree in interactive ANVIO
		5. fig1_published.png
		6. fig1_ED.png
	2. Figure1_unnecessary_figures
		Output files from the ANVIO6 pipeline not used for the final figure.
2. Figure 2
	1. Step 1 Build Database
		Output files for the different ocean metagenomes for the first step, building the database.
	2. Step 2 Blast for Proteins in MAGS
		Output files for the second step which constitues the blast for the nifD nifH proteins for the MAGS for the 8 different environments.
	3. Step 3 Align
		Output files containing the info. from the alignment step of both nifH and nifD sequences.
	4. Step 4 Build Tree
		Final output file for the tree building step. Both out files for nifD and nifH are found here.
	5. Step 5
		Final image comparisons between our results and the published results.
3. Figure 3
	1. Output images created using the python script

### Other directories
1. Recovered: These are the recovered files that were deleted using git reset --hard. They have very weird names and it's probably impossible to figure out which is which without opening them. But thought it would be reasonable to include them in the repo.
2. Trash:
	Inside this folder are all the lost children that we either used but didn't need to or found no use for them at all.

