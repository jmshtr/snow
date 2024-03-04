#!/bin/bash

# Define files to remove
files=(
    "$HOME/.config/gtk-3.0/settings.ini"
    "$HOME/.config/gtk-4.0/settings.ini"
    "$HOME/.config/mimeapps.list"
)

# Iterate over files and move them if they exist
for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        mv "$file" "$file.bak"
        echo "Moved $file to $file.bak"
    else
        echo "$file does not exist, skipping"
    fi
done
