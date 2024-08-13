#!/bin/bash

echo "Welcome to Webp To PNG Conversion Utility V1"

# Ask user for the directory containing webp images
read -p "Please provide the full path to the directory where your WebP images are stored: " webp_dir

# Ask user for the path to the watermark image
read -p "Please provide the full path to the watermark image you'd like to add: " watermark_path

# Create a directory to store converted and watermarked images
output_dir="$webp_dir/PNG_converted_watermarked"
mkdir -p "$output_dir"

# Counter for renaming images
counter=1

# Loop through all WebP images in the specified directory
for webp_file in "$webp_dir"/*.webp; do
    # Convert WebP to PNG and apply watermark
    output_file="$output_dir/$counter.png"
    convert "$webp_file" png:- | composite -gravity center "$watermark_path" - "$output_file"

    # Increment counter
    counter=$((counter + 1))
done

echo "Conversion complete! Your images have been saved in the $output_dir directory."
