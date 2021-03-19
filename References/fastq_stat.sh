#!/bin/bash
set -e -u -o pipefail

# assign a file to the variable
#fastq_file=201-S4-V4-V5_S53_L001_R1_001.fastq

# Specify the input for the first argument
fastq_file="$1"

# add date
date

# Check whether the FASTQ file exists, if it is a regular file, and if it can be read
if [ ! -f "$fastq_file" ] || [ ! -r "$fastq_file" ] || [ ! -e "$fastq_file" ]; then

    echo "Error: either is not file, does not exist, or cannot be read"
    echo "You provided $fastq_file"
    exit 1

fi

# check number of arguments pushed to command line
if [ ! "$#" -eq 1 ]; then

    echo "Error: number of arguments is too great"
    echo "You provided $#"
    exit 1
fi

# report script name and name of FASTQ file processing
echo "$0: a basic script"
echo "Processing $fastq_file"

# compute and report number of sequences in FASTQ file
n_lines=$(wc -l < "$fastq_file")
n_seqs=$(expr "$n_lines" / 4)

echo "$n_seqs"

# search for primers (forward and reverse primers and reads are separate)
if echo "$fastq_file" | grep _R1_ >/dev/null; then
   
   echo "FASTQ file contains forward reads"
    n_primerF=$(grep -Ec "GAGTG[CT]CAGC[AC]GCCGCGGTAA|TTACCGCGGC[GT]GCTG[AG]CACTC" "$fastq_file")
    echo "Number of forward primer seqs found: $n_primerF"

    else

    echo "FASTQ file contains reverse reads"
    n_primerR=$(grep -Ec "ACGGACTAC[GATC][ACG]GGGT[AT]TCTAAT|ATTAGA[AT]ACCC[CGT][GATC]GTAGTCCGT" "$fastq_file")
    echo "Number of reverse primer seqs found: $n_primerR"

fi

echo "Count table of sequence lengths:"
awk '{ if(NR%4 == 2) print length($0) }' "$fastq_file" | sort | uniq -c

# add date
date