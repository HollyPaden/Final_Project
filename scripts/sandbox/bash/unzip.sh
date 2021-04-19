#!/bin/bash
set -e -u -o pipefail

# Let script accept a list of FASTQ file names
zipped_file_list="$1"
output_dir="$2"
fastq_library="$3"

# Create and assign output directory
mkdir -p "$output_dir"

# Create and assign fastq library
mkdir -p "$output_dir"/"$fastq_library"

# Make an array
fastq_zipped_files=($(cat "$zipped_file_list"))

# Unzip fastq files and loop through array
for fastq_zip_file in "${fastq_zipped_files[@]}"; do

    echo "Unzipping fastq file: $fastq_zip_file"

    fastq_file="$(gzip "$fastq_zip_file")" > "$output_dir"/"$fastq_library"/"$fastq_file"

done

echo "Unzip complete. Please procede to next step."