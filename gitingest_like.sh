#!/usr/bin/env bash

# Summary
echo "Summary:"
echo "Repository: $(git remote get-url origin)"
echo "Commit: $(git rev-parse HEAD)"
echo "Files analyzed: $(git ls-files | wc -l)"

# Directory structure
echo -e "\nDirectory structure:"
if command -v tree >/dev/null 2>&1; then
    tree
else
    find . -type d | sed 's|^\./||'
fi

# Files Content
echo -e "\nFiles Content:"
for file in $(git ls-files); do
  echo "================================================"
  echo "FILE: $file"
  echo "================================================"
  cat "$file"
  echo
done
exit 0
