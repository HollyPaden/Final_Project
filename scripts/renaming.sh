#!/bin/bash
set -e -u -o pipefail

# Let script accept a list of FASTQ file names
fastq_file_list="$1"
output_dir="$2"
fastq_library="$3"

# Create an array
fastq_files=($(cat "$fastq_file_list"))

# Rename D35
for fastq_file in "${fastq_file_list[@]}"; do

    echo "Renaming Day 35 fastq files"

    if oldname in fastq_file ^"3"; then
        
        newname=$("D $oldname")

        # Double check correct naming via `echo` prior to move
        echo "Old name: $oldname"
        echo "New name: $newname"

        # replace file
        mv "$oldname" "$newname"

    fi

done

# Rename T-1 files

for fastq_file in "${fastq_file_list[@]}"; do

    echo "Renaming Day T-1 fastq files"

    if oldname in fastq_file ^"T"; then

        newname=$("D $oldname")

        # Double check correct naming via `echo` prior to move
        echo "Old name: $oldname"
        echo "New name: $newname"

        # replace file
        mv "$oldname" "$newname"

    fi

done