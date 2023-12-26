#!/bin/bash

# Set the log file path
log_file="log.txt"

# Get the current date
current_date=$(date +"%Y-%m-%d %H:%M:%S")

# Check if log.txt exists and read the current number
if [ -f "$log_file" ]; then
    last_entry=$(tail -n 1 "$log_file")
    number=$(echo "$last_entry" | awk '{print $NF}')
    number=$((number + 1))
else
    # Set the initial number if log.txt doesn't exist
    number=1
fi

# Log the current date and number to log.txt
echo "$current_date - $number" >> "$log_file"

# Run Git commands
git add .
git status
git commit -m "Edit and auto launch scripted $number - $current_date"
git push -u origin main
