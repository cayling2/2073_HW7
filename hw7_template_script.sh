#!/bin/bash
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=cmg276@pitt.edu
#SBATCH -M teach
#SBATCH -A hugen2072-2026s
#SBATCH -t 1:00:00



# INSTRUCTIONS
# The script below runs S-PrediXcan using summary stats from a COVID-19 GWAS performed by the COVID-19 host genetics initiative (https://www.covid19hg.org)
# The phenotype is "Very severe respiratory confirmed covid vs. population"
# Look over the script, which is mostly complete
# You need to provide the following:
# 	the path to the prediction model you want to use (pick the 'correct' tissue from /ix1/hugen2073-2026s/hw7/tissue_weights/)
#	the path to the LD structure file you want to use (pick the 'correct' matching file from /ix1/hugen2073-2026s/hw7/ld/)
# 	the full path to the results .csv file (it will have a row for each gene)
# 	the correct values for snp_column, effect_allele_column, non_effect_allele_column, or_column, and pvalue_column
# Use the data dictionary to plug in the correct column names in place of the ???s below
# The data dictionary is here: https://www.covid19hg.org/results/r7/ (see the "Data Columns" section)

# Run S-PrediXcan
#   Specify the path to the model file (you need to do that! replace FILENAME.txt below)
#   Specify the path to the LD structure file (you need to do that! replace FILENAME.txt below)
#   Specify the *directory* the GWAS results are in (don't need to give the file name itself; this is already set up)
#   Tell the program that the results are compressed (.gz)
#   Specify the names of the columns containing the important info (i.e., replace the ???s with the correct column names)
#   Specify the full path to where the output file should go (including the file name; the file will be a .csv; replace FILEPATH below)
/ix1/hugen2073-2026s/hw7/env/bin/python /ix1/hugen2073-2026s/hw7/MetaXcan/software/SPrediXcan.py \
--model_db_path /ix1/hugen2073-2026s/hw7/tissue_weights/gtex_v7_Lung_imputed_europeans_tw_0.5_signif.db \
--covariance    /ix1/hugen2073-2026s/hw7/ld/gtex_v7_Lung_imputed_eur_covariances.txt.gz \
--gwas_folder   /ix1/hugen2073-2026s/hw7/GWAS/ \
--gwas_file_pattern ".*gz" \
--snp_column rsid \
--effect_allele_column ALT \
--non_effect_allele_column REF \
--or_column OR \
--pvalue_column all_inv_var_meta_p \
--output_file /ihome/hugen2071-2025f/cmg276/2073_hw7/hw7_results.csv

