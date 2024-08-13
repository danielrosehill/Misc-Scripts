#!/bin/bash

# Ask the user to provide the directory where the script should run
read -p "Please enter the directory where the script should run: " input_directory

# Check if the directory exists
if [[ ! -d "$input_directory" ]]; then
    echo "The directory '$input_directory' does not exist."
    exit 1
fi

# Navigate to the input directory
cd "$input_directory"

# Create a folder named 'numbered' in the input directory
mkdir -p numbered

# Initialize a counter
counter=1

# Loop through all files in the input directory
for file in *; do
    # Check if it's a file and not the script or the 'numbered' directory
    if [[ -f "$file" && "$file" != "${0##*/}" && "$file" != "numbered" ]]; then
        extension="${file##*.}"
        
        # If the file is a webp, convert it to png
        if [[ "$extension" == "webp" ]]; then
            convert "$file" "numbered/$counter.png"
        else
            # Copy the file to the 'numbered' directory with a sequential number
            cp "$file" "numbered/$counter.$extension"
        fi
        
        # Increment the counter
        ((counter++))
    fi
done

echo "Files have been processed and saved in the 'numbered' folder within $input_directory."
