#!/bin/bash

# Define the paths
input_directory="/home/daniel/Images/Watermarking/to-watermark"
watermark="/home/daniel/Images/Watermarking/watermarks/latest.png"
output_directory="/home/daniel/Images/Watermarking/watermarked"

# Fixed watermark location (bottom right corner)
watermark_position="SouthEast"
offset_x=10
offset_y=10

# Ensure the output directory exists
mkdir -p "$output_directory"

# Loop through all image files in the input directory
for image in "$input_directory"/*.{jpg,jpeg,png,webp}; do
    # Check if there are any images to process
    if [ ! -e "$image" ]; then
        echo "No images found in the input directory."
        exit 1
    fi

    # Extract the base filename
    filename=$(basename "$image")

    # Add watermark to the image and save it to the output directory
    convert "$image" "$watermark" -gravity "$watermark_position" -geometry +${offset_x}+${offset_y} -composite "$output_directory/$filename"

    echo "Watermarked $filename and moved it to $output_directory"
done

echo "All images have been watermarked and moved to $output_directory."
