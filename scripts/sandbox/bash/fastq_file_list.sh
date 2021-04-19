#!/bin/bash
set -e -u -o pipefail

# Create list of FASTQ files
fastq_file_list=fastq_file_list.txt

ls "$output_dir"/"$fastq_library"/*fastq > "$fastq_file_list"

# Run fastq loop script
output_dir=../results

./renaming.sh "$fastq_file_list" "$output_dir"