#!/bin/bash

# Check for the correct number of arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_directory> <output_file>"
    exit 1
fi

# Assign command-line arguments to variables
input_directory="$1"
output_file="$2"

# Check if the output directory exists, if not create it
output_dir=$(dirname "$output_file")
if [ ! -d "$output_dir" ]; then
    mkdir -p "$output_dir"
fi

# Concatenate all FASTQ files in the input directory
cat "$input_directory"/*.fastq > "$output_file"

echo "All files have been concatenated into $output_file"
