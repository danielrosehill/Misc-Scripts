#!/bin/bash

# Fixed watermark location (bottom right corner)
watermark_position="SouthEast"
offset_x=10
offset_y=10

# Hardcoded path to the watermark image
watermark="/path/to/your/watermark.png"

# Prompt the user for the input directory
read -p "Enter the path to the input directory: " input_directory

# Set the output directory to a 'watermarked' folder inside the input directory
output_directory="$input_directory/watermarked"

# Ensure the output directory exists
mkdir -p "$output_directory"

# Loop through all images in the input directory
for image in "$input_directory"/*.{jpg,jpeg,png}; do
  # Extract the base filename
  filename=$(basename "$image")
  
  # Add watermark to the image and save to the output directory
  convert "$image" "$watermark" -gravity "$watermark_position" -geometry +${offset_x}+${offset_y} -composite "$output_directory/$filename"
done

echo "Watermarking completed. Check the output directory: $output_directory"
