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
