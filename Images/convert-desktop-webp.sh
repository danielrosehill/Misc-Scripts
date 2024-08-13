#!/bin/bash

# Define the base directory and the target directories for converted and original images
base_directory="/home/daniel/Desktop"
converted_directory="$base_directory/Converted_WEBP"
originals_directory="$converted_directory/Originals"

# Display initial text when the script is initiated, including the base directory
echo "This script will find all .webp images in $base_directory, convert them to PNG, rename them sequentially, and move them to the Converted_WEBP folder."
echo "It will also copy the original .webp images to the Originals subfolder within Converted_WEBP, and rename them sequentially."
echo "The base directory is hardcoded into the script. So if you want to change it, you'll need to edit the Bash file."

# Ask the user if they want to proceed
read -p "Do you want to proceed? (yes/no): " user_input

# Convert the user input to lowercase to handle YES/NO variations
user_input=$(echo "$user_input" | tr '[:upper:]' '[:lower:]')

# Check the user's input
if [[ "$user_input" == "yes" || "$user_input" == "y" ]]; then
    echo "Proceeding with the script..."

    # Ensure the Converted_WEBP and Originals directories exist
    mkdir -p "$converted_directory"
    mkdir -p "$originals_directory"

    # Initialize a counter for sequential numbering
    counter=1

    # Find all .webp images in the base directory
    find "$base_directory" -maxdepth 1 -type f -iname "*.webp" | while read -r image; do
        # Convert the .webp image to .png
        new_image="$converted_directory/$counter.png"
        convert "$image" "$new_image"

        # Copy the original .webp image to the Originals subfolder and rename it
        original_image="$originals_directory/$counter.webp"
        cp "$image" "$original_image"

        # Increment the counter for the next image
        counter=$((counter + 1))
    done

    echo "Conversion and renaming completed. Check the Converted_WEBP and Originals folders for the new images."

else
    echo "Script aborted by the user."
    exit 1
fi
