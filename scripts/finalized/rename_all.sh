#!/bin/bash

set -euo pipefail

indir=$1     # indir=input_dir/
outdir=$2    # outdir=output_dir/renamed_fastq

mkdir -p "$outdir"

for oldname in "$indir"/*; do
    python scripts/finalized/file_renaming.py "$oldname" "$outdir"
done