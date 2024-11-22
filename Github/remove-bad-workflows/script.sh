#!/bin/bash

# Ensure repositories.txt exists
if [[ ! -f repositories.txt ]]; then
  echo "Error: repositories.txt not found. Please create the file with a list of repositories."
  exit 1
fi

# Loop through each repository in repositories.txt
while IFS= read -r repo; do
  echo "Processing repository: $repo"

  # Check if the directory exists
  if [[ ! -d "$repo" ]]; then
    echo "Error: Directory $repo does not exist. Skipping..."
    continue
  fi

  # Navigate to the repository
  cd "$repo" || { echo "Error: Unable to navigate to $repo. Skipping..."; continue; }

  # Check if .github/workflows exists
  if [[ -d .github/workflows ]]; then
    echo "Removing workflows in $repo..."
    rm -f .github/workflows/*.yml .github/workflows/*.yaml

    # Check if there are changes to commit
    if [[ -n $(git status --porcelain) ]]; then
      git add .
      git commit -m "Remove GitHub workflows from .github/workflows"
      git push origin "$(git rev-parse --abbrev-ref HEAD)"
      echo "Workflows removed and changes pushed for $repo."
    else
      echo "No changes to commit for $repo."
    fi
  else
    echo "No workflows directory found in $repo. Skipping..."
  fi

  # Navigate back to the original directory
  cd - > /dev/null || exit
done < repositories.txt

echo "Script completed."