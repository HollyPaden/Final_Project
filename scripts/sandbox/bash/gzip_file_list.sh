#!/bin/bash
set -e -u -o pipefail

# Create list of FASTQ.gz files
zipped_file_list=zipped_fastq_file_list.txt

ls ../input_dir/*fastq.gz > "$zipped_file_list"

# Run fastq loop script
output_dir=../results

./unzip.sh "$zipped_file_list" "$output_dir"