#!/bin/bash

echo "Welcome to Webp To PNG Conversion Utility V1"

# Ask user for the directory containing webp images
read -p "Please provide the full path to the directory where your WebP images are stored: " webp_dir

# Ask user for the desired width of the watermark in pixels
read -p "Please enter the desired width of the watermark in pixels: " watermark_width

# Hardcoded path to the watermark image
watermark_path="/home/daniel/Images/Watermarking/watermarks/latest.png"

# Create a directory to store converted and watermarked images
output_dir="$webp_dir/PNG_converted_watermarked"
mkdir -p "$output_dir"

# Counter for renaming images
counter=1

# Loop through all WebP images in the specified directory
for webp_file in "$webp_dir"/*.webp; do
    # Convert WebP to PNG
    output_file="$output_dir/$counter.png"
    convert "$webp_file" "$output_file"
    
    # Resize the watermark to the user-defined width
    resized_watermark="/tmp/resized_watermark.png"
    convert "$watermark_path" -resize "$watermark_width"x "$resized_watermark"
    
    # Apply the resized watermark in the bottom right corner
    composite -gravity southeast "$resized_watermark" "$output_file" "$output_file"
    
    # Increment counter
    counter=$((counter + 1))
done

echo "Conversion complete! Your images have been saved in the $output_dir directory."
