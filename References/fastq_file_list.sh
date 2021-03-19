#!/bin/bash
set -e -u -o pipefail

# Create list of FASTQ files
file_list=fastq_file_list.txt

ls *fastq > "$file_list"

# Run fastq loop script
output_dir=results/fastq_stats

./fastq_stat_loop.sh "$file_list" "$output_dir"