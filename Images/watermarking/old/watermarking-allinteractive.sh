#!/bin/bash

# Prompt the user for the input directory
read -p "Enter the path to the input directory: " input_directory

# Prompt the user for the output directory
read -p "Enter the path to the output directory: " output_directory

# Prompt the user for the watermark image
read -p "Enter the path to the watermark image: " watermark

# Ensure the output directory exists
mkdir -p "$output_directory"

# Loop through all images in the input directory
for image in "$input_directory"/*.{jpg,jpeg,png}; do
  # Extract the base filename
  filename=$(basename "$image")
  
  # Add watermark to the image and save to the output directory
  convert "$image" "$watermark" -gravity SouthEast -geometry +10+10 -composite "$output_directory/$filename"
done

echo "Watermarking completed. Check the output directory: $output_directory"
