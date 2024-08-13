#!/bin/bash

input_directory="./input_images"
output_directory="./output_images"
watermark="./watermark.png"

mkdir -p "$output_directory"

for image in "$input_directory"/*.{jpg,jpeg,png}; do
  filename=$(basename "$image")
  
  convert "$image" "$watermark" -gravity SouthEast -geometry +10+10 -composite "$output_directory/$filename"
done
