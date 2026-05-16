#!/bin/bash

# Script to mimic basic Git history and file change output

echo "--- Git History Summary ---"

# Display the last 5 commits
echo -e "\nLast 5 Commits:"
git log -5 --oneline

echo -e "\n--- File Changes Summary (Last Commit) ---"

# Display files changed in the last commit
echo "Files changed in the last commit:"
git show HEAD

echo -e "\n--- Directory Structure ---"
# Display directory structure using tree command (assuming it's available, or use find/ls)
# Using find for broader compatibility, listing files in the current directory and subdirectories
find . -print

echo -e "\n--- File Contents ---"
# Display contents of all relevant files
find . -type f -print0 | while IFS= read -r -d $'\0' file; do
    echo "=================================================="
    echo "File: $file"
    echo "=================================================="
    cat "$file"
    echo -e "\n"
done
