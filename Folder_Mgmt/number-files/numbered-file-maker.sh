# Verified working on Fedora 13-08-24

#!/bin/bash

mkdir -p numbered

counter=1

for file in *; do

    if [[ -f "$file" && "$file" != "${0##*/}" && "$file" != "numbered" ]]; then
        extension="${file##*.}"
        

        if [[ "$extension" == "webp" ]]; then
            convert "$file" "numbered/$counter.png"
        else
    
            cp "$file" "numbered/$counter.$extension"
        fi
        

        ((counter++))
    fi
done
