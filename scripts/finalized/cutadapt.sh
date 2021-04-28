#!/bin/bash
set -e -u -o pipefail

#Load the cutadapt environment so that the script can run
#Be sure that you have already called `module load python/3.6-conda5.2`
source activate cutadaptenv

#Add date
date

#Let script accept up to 4 arguments that can be passed to it on the command-line
#Note that input and output are set by Snakemake
#The forward and reverse sequences are coded at the top of the Snakefile (lines 9 and 10)

input="$1"
out_dir="$2"
forward_primer="$3"
reverse_primer="$4"  

#If necessary to make output directory, uncomment next line
#mkdir -p "$out_dir"

#Message to indicate the script has initiated
echo "Script running...please wait"

#Check whether the FASTQ file exists, if it is a regular file, and if it can be read
if [ ! -f "$input" ] || [ ! -r "$input" ] || [ ! -e "$input" ]; then

    echo "Error: either is not file, does not exist, or cannot be read"
    echo "You provided $input"
    exit 1

fi

#Indicate quality check complete
echo "Control checks complete, files accepted"

#Compute the reverse complements of each primer
fp_complement=$(echo "$forward_primer" | tr ATGCYM TACGRK | rev)
rp_complement=$(echo "$reverse_primer" | tr ATGCKR TACGMY | rev)

#Indicate complements calculated
echo "Primer compliments computed"

#Infer reverse reads FASTQ file from forward reads FASTQ file
reverse_fastq="$(echo "$input" | grep  _R1 | sed 's/R1/R2/' )"
  
#Indicate reverse FASTQ inferred
echo "Reverse reads FASTQ initiated: $reverse_fastq"

#Change output file name
trimmed_fastq_f=$(basename "$input" .fastq.gz)_trimmed.fastq.gz 
#Confirm that the file is named as you would expect
echo "Trimmed fastq forward read: $trimmed_fastq_f"

trimmed_fastq_r=$(basename "$reverse_fastq" .fastq.gz)_trimmed.fastq.gz 
#Confirm that the file is named as you would expect
echo "Trimmed fastq reverse read: $trimmed_fastq_r"

#Indicate trimmed FASTQ arguments created
echo "Sequence trim completed...calling Cutadapt"

#Create output for cutadapt readout
# Note: this is optional if running the script alone
# log writing is handled by Snakemake in this case
####readout=$(basename "$input" .fastq.gz)_cutadapt_readout.txt > "$out_dir"/"$readout"

#Call Cutadapt
cutadapt -a "$forward_primer"..."$rp_complement" \
    -A "$reverse_primer"..."$fp_complement" \
    --discard-untrimmed --pair-filter=any \
    -o "$out_dir"/"$trimmed_fastq_f" -p "$out_dir"/"$trimmed_fastq_r" "$input" "$reverse_fastq" 

# Add this line if running script without Snakemake to save log
#####    > "$output"/"$readout"

#Report completion of Cutadapt run
echo "Cutadapt complete at..."

#Follow up with date
date