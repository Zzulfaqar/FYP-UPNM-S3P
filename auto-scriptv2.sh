#!/bin/bash

# Set the log file path
log_file="log.txt"

# Get the current date
current_date=$(date +"%Y-%m-%d %H:%M:%S")

# Check if log.txt exists and read the current number
if [ -f "$log_file" ]; then
    number=$(cat "$log_file")
else
    # Set the initial number if log.txt doesn't exist
    number=1
fi

# Increment the number
number=$((number + 1))

# Log the current number and date to log.txt
echo "$current_date - $number" >> "$log_file"

# Run Git commands
git add .
git status
git commit -m "Edit and auto launch scripted $number - $current_date"
git push -u origin main
