#!/bin/bash

# Check if the file exists
if [ -e "$1" ]; then
    echo "File '$1' exists."


    # Check if it's a regular file
    if [ -f "$1" ]; then
        echo "File Type: Ordinary File"


        # Display access permissions
        permissions=$(stat -c %A "$1")
        echo "Access Permissions: $permissions"


        # Display file size
        size=$(stat -c %s "$1")
        echo "Size: $size bytes"


        # Display the time of last modification
        modification_time=$(stat -c %y "$1")
        echo "Last Modification Time: $modification_time"

    # Check if it's a directory
    elif [ -d "$1" ]; then
        echo "File Type: Directory"

        # Count the number of files and subdirectories
        num_files=$(find "$1" -maxdepth 1 -type f | wc -l)
        num_subdirectories=$(find "$1" -maxdepth 1 -type d | wc -l)

        echo "Number of Files: $num_files"
        echo "Number of Subdirectories: $num_subdirectories"

    fi

else
    echo "File '$1' does not exist."
fi
