#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <path-to-txt-file> <path-to-directory-with-fastq-files>"
    exit 1
fi

# Assigning command line arguments to variables
txt_file="$1"
fastq_dir="$2"

# Extract the base name of the txt file without the extension
base_name=$(basename "$txt_file" .txt)

# Initialize the output files
output_1="${base_name}_1.fastq"
output_2="${base_name}_2.fastq"

# Make sure the output files are empty to start with
> "$output_1"
> "$output_2"

# Read each line from the txt file
while IFS= read -r line; do
    # Use the read line to construct the filename pattern and concatenate
    cat "${fastq_dir}/${line}"_*_1.fastq >> "$output_1"
    cat "${fastq_dir}/${line}"_*_2.fastq >> "$output_2"
done < "$txt_file"

echo "Concatenation complete."
echo "Output files: $output_1, $output_2"
