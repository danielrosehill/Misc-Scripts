#!/bin/bash

# Fixed watermark location (bottom right corner)
watermark_position="SouthEast"
offset_x=10
offset_y=10

# Hardcoded path to the watermark image
watermark="/home/daniel/watermarks/overlay.png"

# Prompt the user for the input directory
read -p "Enter the path to the input directory: " input_directory

# Set the output directory to a 'watermarked' folder inside the input directory
output_directory="$input_directory/watermarked"

# Ensure the output directory exists
mkdir -p "$output_directory"

# Get the first image in the input directory that matches jpg, jpeg, png, or webp
image=$(ls "$input_directory"/*.{jpg,jpeg,png,webp} 2>/dev/null | head -n 1)

# Check if an image was found
if [ -z "$image" ]; then
    echo "No image found in the specified formats (jpg, jpeg, png, webp) in the directory."
    exit 1
fi

# Extract the base filename
filename=$(basename "$image")

# Add watermark to the image and save to the output directory
convert "$image" "$watermark" -gravity "$watermark_position" -geometry +${offset_x}+${offset_y} -composite "$output_directory/$filename"

echo "Test Watermarked Image generated: $output_directory/$filename"
