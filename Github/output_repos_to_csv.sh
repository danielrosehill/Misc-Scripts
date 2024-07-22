#!/bin/bash

GITHUB_USERNAME=[youruser]
GITHUB_TOKEN=[yourghtoken]]
OUTPUT_FILE=repos.csv

 
list_repos_to_csv() {
    page=1
    echo "Repository,URL" > $OUTPUT_FILE  
    while :; do
        response=$(curl -s -H "Authorization: token $GITHUB_TOKEN" \
        "https://api.github.com/user/repos?per_page=100&page=$page")

        
        if echo "$response" | jq -e 'has("message")' > /dev/null; then
            echo "Error: $(echo "$response" | jq -r '.message')"
            exit 1
        fi

      
        repos=$(echo "$response" | jq -r '.[] | "\(.name),\(.html_url)"')

       
        if [ -z "$repos" ]; then
            break
        fi

       
        echo "$repos" >> $OUTPUT_FILE
        page=$((page + 1))
    done
}

 
list_repos_to_csv