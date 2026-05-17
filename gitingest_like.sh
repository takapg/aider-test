#!/bin/bash

# Summary
echo "Summary:"
echo "Repository: $(git remote get-url origin)"
echo "Commit: $(git rev-parse HEAD)"
echo "Files analyzed: $(git ls-files | wc -l)"

# Directory structure
echo -e "\nDirectory structure:"
tree

# Files Content
echo -e "\nFiles Content:"
for file in $(git ls-files); do
  echo "================================================"
  echo "FILE: $file"
  echo "================================================"
  cat "$file"
  echo
done
