#!/bin/bash

# Define the base directory and the new Images directory
base_directory="/home/daniel/Desktop"
images_directory="$base_directory/Images"

# Create the Images directory if it doesn't exist
mkdir -p "$images_directory/png"
mkdir -p "$images_directory/jpg"
mkdir -p "$images_directory/webp"

# Move all PNG images to the png subfolder
find "$base_directory" -maxdepth 1 -type f -iname "*.png" -exec mv {} "$images_directory/png/" \;

# Move all JPG images to the jpg subfolder
find "$base_directory" -maxdepth 1 -type f -iname "*.jpg" -exec mv {} "$images_directory/jpg/" \;
find "$base_directory" -maxdepth 1 -type f -iname "*.jpeg" -exec mv {} "$images_directory/jpg/" \;

# Move all WEBP images to the webp subfolder
find "$base_directory" -maxdepth 1 -type f -iname "*.webp" -exec mv {} "$images_directory/webp/" \;

echo "Images have been sorted into the appropriate folders in $images_directory."
