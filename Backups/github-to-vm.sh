#!/bin/bash

# Configuration
BACKUP_DIR=~/backups/danielgithub/
GITHUB_TOKEN=[redacted]"
GITHUB_API_URL="https://api.github.com/user/repos"
MAX_JOBS=4  # Number of parallel jobs

# Ensure the backup directory exists
mkdir -p "$BACKUP_DIR"

# Fetch all repositories with their default branches
repos=$(curl -s -H "Authorization: token $GITHUB_TOKEN" "$GITHUB_API_URL?per_page=100" | jq -r '.[] | "\(.ssh_url) \(.default_branch)"')

# Backup a single repository
backup_repo() {
    repo_url=$1
    default_branch=$2
    repo_name=$(basename "$repo_url" .git)
    
    cd "$BACKUP_DIR" || exit

    if [ -d "$repo_name" ]; then
        echo "Fetching updates for $repo_name on branch $default_branch"
        cd "$repo_name" || exit
        git fetch --all --prune
        cd ..
    else
        echo "Cloning $repo_name"
        git clone --mirror "$repo_url"
    fi
}

export -f backup_repo
export BACKUP_DIR
export GITHUB_TOKEN

# Run backups in parallel
echo "$repos" | xargs -n 2 -P $MAX_JOBS bash -c 'backup_repo "$@"' _

# Ping the health check URL
curl -fsS --retry 3 "[redacted]" > /dev/null

echo "Health check ping sent."
