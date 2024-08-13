mkdir -p png && for file in *.webp; do dwebp "$file" -o "png/${file%.webp}.png"; done
