#!/bin/bash

# Define the base directory
base_directory="/home/daniel/Desktop"

# Define the new directories
images_directory="$base_directory/Images"
data_directory="$base_directory/Data"
programs_directory="$base_directory/Programs"
documents_directory="$base_directory/Documents"

# Create the necessary directories if they don't exist
mkdir -p "$images_directory/png"
mkdir -p "$images_directory/jpg"
mkdir -p "$images_directory/webp"
mkdir -p "$data_directory"
mkdir -p "$programs_directory"
mkdir -p "$documents_directory"

# Move all PNG images to the png subfolder
find "$base_directory" -maxdepth 1 -type f -iname "*.png" -exec mv {} "$images_directory/png/" \;

# Move all JPG images to the jpg subfolder
find "$base_directory" -maxdepth 1 -type f -iname "*.jpg" -exec mv {} "$images_directory/jpg/" \;
find "$base_directory" -maxdepth 1 -type f -iname "*.jpeg" -exec mv {} "$images_directory/jpg/" \;

# Move all WEBP images to the webp subfolder
find "$base_directory" -maxdepth 1 -type f -iname "*.webp" -exec mv {} "$images_directory/webp/" \;

# Move all CSV files to the Data folder
find "$base_directory" -maxdepth 1 -type f -iname "*.csv" -exec mv {} "$data_directory/" \;

# Move all XLS and XLSX files to the Data folder
find "$base_directory" -maxdepth 1 -type f -iname "*.xls" -exec mv {} "$data_directory/" \;
find "$base_directory" -maxdepth 1 -type f -iname "*.xlsx" -exec mv {} "$data_directory/" \;

# Move all AppImage files to the Programs folder
find "$base_directory" -maxdepth 1 -type f -iname "*.appimage" -exec mv {} "$programs_directory/" \;

# Move all RPM files to the Programs folder
find "$base_directory" -maxdepth 1 -type f -iname "*.rpm" -exec mv {} "$programs_directory/" \;

# Move all DOC and DOCX files to the Documents folder
find "$base_directory" -maxdepth 1 -type f -iname "*.doc" -exec mv {} "$documents_directory/" \;
find "$base_directory" -maxdepth 1 -type f -iname "*.docx" -exec mv {} "$documents_directory/" \;

# Move all PDF files to the Documents folder
find "$base_directory" -maxdepth 1 -type f -iname "*.pdf" -exec mv {} "$documents_directory/" \;

echo "Files have been sorted into the appropriate folders in $base_directory."
