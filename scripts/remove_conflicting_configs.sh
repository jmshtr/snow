#!/bin/bash

# Define files to remove
files=(
    "$HOME/.config/gtk-3.0/settings.ini"
    "$HOME/.config/gtk-4.0/settings.ini"
    "$HOME/.config/mimeapps.list"
)

# Log file
logfile="/var/log/config_backup.log"

# Iterate over files and move them if they exist
for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        # Move the file to a backup location
        mv "$file" "$file.bak" && echo "$(date) - Moved $file to $file.bak" >> "$logfile"
        if [ $? -eq 0 ]; then
            echo "Moved $file to $file.bak"
        else
            echo "Failed to move $file to $file.bak" >&2
            echo "Failed to move $file to $file.bak" >> "$logfile"
        fi
    else
        echo "$file does not exist, skipping"
    fi
done
