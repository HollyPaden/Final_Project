#!/bin/bash
set -e -u -o pipefail

#Add date
date

#Let script accept 2 arguments that can be passed to it on the command-line
#Note that input and output are set by Snakemake, do not need here
../input_dir/D35_006_C_S74_L001_R1_001.fastq.gz="$1"
../output_dir="$2"
forward_primer="$3"
reverse_primer="$4"

forward_primer="AYTGGGYDTAAAGNG"
reverse_primer="TACNVGGGTATCTAATCC"  

#Message to indicate the script has initiated
echo "Script running...please wait"

#Compute the reverse complements of each primer
fp_complement=$(echo "$forward_primer" | tr ATGCYM TACGRK | rev)
rp_complement=$(echo "$reverse_primer" | tr ATGCKR TACGMY | rev)

#Indicate complements calculated
echo "Primer compliments computed"

#Infer reverse reads FASTQ file from forward reads FASTQ file
reverse_fastq="$(echo "$1" | zgrep  _R1_ | sed 's/R1/R2/' )"

#Indicate reverse FASTQ inferred
echo "Reverse reads FASTQ initiated"

#Change output file name
trimmed_fastq_f=$(basename "$1" .fastq.gz)_trimmed.fastq.gz 
#> "$output_directory"/"$trimmed_fastq_f"

trimmed_fastq_r=$(basename "$reverse_fastq" .fastq/gz)_trimmed.fastq.gz 
#> "$output_directory"/"$trimmed_fastq_r"

#Indicate trimmed FASTQ arguments created
echo "Sequence trim completed...calling Cutadapt"

#Create output for cutadapt readout
readout=$(basename "$1" .fastq.gz)_cutadapt_readout.txt > "$2"/"$readout"

#Call Cutadapt
cutadapt -a "$forward_primer"..."$rp_complement" \
    -A "$reverse_primer"..."$fp_complement" \
    --discard-untrimmed --pair-filter=any \
    -o "$2"/"$trimmed_fastq_f" -p "$2"/"$trimmed_fastq_r" "$1" "$reverse_fastq" \
    > "$2"/"$readout"

#Report completion of Cutadapt run
echo "Cutadapt complete at..."

#Follow up with date
date