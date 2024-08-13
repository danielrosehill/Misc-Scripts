#!/bin/bash

# Prompt the user for the input directory
read -p "Enter the input directory: " input_dir

# Set the watermark file path
watermark="/home/daniel/Images/Watermarking/watermarks/latest.png"

# Loop through all image files in the input directory
for img in "$input_dir"/*.{jpg,jpeg,png,gif}; do
    # Check if the file exists
    if [ -f "$img" ]; then
        # Add the watermark to the bottom right, 300px from the edges
        composite -gravity southeast -geometry +300+300 "$watermark" "$img" "$img"
        echo "Watermarked: $img"
    fi
done

echo "Watermarking completed."
