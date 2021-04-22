#!/bin/bash
set -e -u -o pipefail

conda activate cutadaptenv

#Add date
date

#Let script accept 2 arguments that can be passed to it on the command-line
#Note that input and output are set by Snakemake 

input="$1"
output="$2"
forward_primer="$3"
reverse_primer="$4"  

#Message to indicate the script has initiated
echo "Script running...please wait"

#Compute the reverse complements of each primer
fp_complement=$(echo "$forward_primer" | tr ATGCYM TACGRK | rev)
rp_complement=$(echo "$reverse_primer" | tr ATGCKR TACGMY | rev)

#Indicate complements calculated
echo "Primer compliments computed"

#Infer reverse reads FASTQ file from forward reads FASTQ file
reverse_fastq="$(echo "$input" | zgrep  _R1_ | sed 's/R1/R2/' )"

#Indicate reverse FASTQ inferred
echo "Reverse reads FASTQ initiated"

#Change output file name
trimmed_fastq_f=$(basename "$input" .fastq.gz)_trimmed.fastq.gz 
#> "$output_directory"/"$trimmed_fastq_f"

trimmed_fastq_r=$(basename "$reverse_fastq" .fastq.gz)_trimmed.fastq.gz 
#> "$output_directory"/"$trimmed_fastq_r"

#Indicate trimmed FASTQ arguments created
echo "Sequence trim completed...calling Cutadapt"

#Create output for cutadapt readout
# Note: this is optional if running the script alone
# log writing is handled by Snakemake in this case
####readout=$(basename "$input" .fastq.gz)_cutadapt_readout.txt > "$output"/"$readout"

#Call Cutadapt
cutadapt -a "$forward_primer"..."$rp_complement" \
    -A "$reverse_primer"..."$fp_complement" \
    --discard-untrimmed --pair-filter=any \
    -o "$output"/"$trimmed_fastq_f" -p "$output"/"$trimmed_fastq_r" "$input" "$reverse_fastq" 
# Add this line if running script without Snakemake to save log
#####    > "$output"/"$readout"

#Report completion of Cutadapt run
echo "Cutadapt complete at..."

#Follow up with date
date