#!/bin/bash

# Script to mimic basic Git history and file change output

echo "--- Git History Summary ---"

# Display the last 5 commits
echo -e "\nLast 5 Commits:"
if ! git log -5 --oneline; then
    echo "Error: Unable to retrieve commit history."
    exit 1
fi

echo -e "\n--- File Changes Summary (Last Commit) ---"

# Display files changed in the last commit
echo "Files changed in the last commit:"
if ! git show HEAD; then
    echo "Error: Unable to retrieve file changes."
    exit 1
fi

echo -e "\n--- Directory Structure ---"

# Display directory structure using find command
echo "Directory structure:"
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
