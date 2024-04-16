#!/bin/bash

# Usage check to ensure correct arguments are passed
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 prefix_file fastq_dir output_dir"
    exit 1
fi

# Assigning command line arguments to variables
prefix_file=$1
fastq_dir=$2
output_dir=$3

# Check if the fastq_dir exists and is a directory
if [ ! -d "$fastq_dir" ]; then
    echo "Error: Directory $fastq_dir does not exist."
    exit 1
fi

# Create output directory if it does not exist
mkdir -p "$output_dir"

# Loop through each prefix in the prefix file
while read -r prefix; do
    # Define output file names
    out1="$output_dir/${prefix}_1.fastq"
    out2="$output_dir/${prefix}_2.fastq"

    # Initialize or clear output files
    : > "$out1"
    : > "$out2"

    # Find and concatenate files matching each pattern
    for file in "$fastq_dir/${prefix}_1.fastq"; do
        cat "$file" >> "$out1"
    done
    for file in "$fastq_dir/${prefix}_2.fastq"; do
        cat "$file" >> "$out2"
    done

    echo "Concatenated files for $prefix into $out1 and $out2"
done < "$prefix_file"

echo "All files processed."
