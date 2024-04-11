#!/bin/bash

# Check if at least three arguments are provided (script name, source directory, destination directory, and at least one sample name)
if [ "$#" -lt 3 ]; then
    echo "Usage: $0 <source_directory> <destination_directory> <sample_names...>"
    exit 1
fi

# The first argument is the source directory
source_directory="$1"
# The second argument is the destination directory
destination_directory="$2"

# Ensure the destination directory exists, create it if it doesn't
if [ ! -d "$destination_directory" ]; then
    mkdir -p "$destination_directory"
fi

# Shift the first two arguments off the list, leaving only the sample names
shift 2

# Loop through each remaining argument, which are the sample names
for sample in "$@"
do
    # Define the file names based on current sample name
    file1="${source_directory}/${sample}_1.fastq"
    file2="${source_directory}/${sample}_2.fastq"

    # Check if the files exist and move them
    if [ -f "$file1" ]; then
        mv "$file1" "$destination_directory"
    else
        echo "File not found: $file1"
    fi

    if [ -f "$file2" ]; then
        mv "$file2" "$destination_directory"
    else
        echo "File not found: $file2"
    fi
done

echo "Files have been moved to $destination_directory."
