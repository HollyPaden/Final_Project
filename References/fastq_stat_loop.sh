#!/bin/bash
set -e -u -o pipefail

# Let script accept a list of FASTQ file names
file_list="$1"
output_dir="$2"

# Create and assign output directory
mkdir -p "$output_dir"

# Make an array
fastq_files=($(cat "$file_list"))

# Report:
echo "Number of fastq files: ${#fastq_files[@]}"

# Loop through the array:
for fastq_file in "${fastq_files[@]}"; do

  echo "Running fastq_stat for FASTQ file $fastq_file"
  
  # Strip .fastq from each FASTQ file, and add suffix:
  results_file="$(basename "$fastq_file" .fastq)-stats.txt"

  # Run "fastq_stat" on a file:
  ./fastq_stat.sh "$fastq_file" > "$output_dir"/"$results_file"

  # Report which FASTQ file will be analyzed
  echo "Currently analyzing..."
  echo "$fastq_file"

done

echo "Analysis complete: please consult the output directory"