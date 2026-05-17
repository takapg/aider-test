#!/bin/bash

# Summary
echo "Summary:"
echo "Repository: $(git remote get-url origin)"
echo "Commit: $(git rev-parse HEAD)"
echo "Files analyzed: $(git ls-files | wc -l)"

# Directory structure
echo -e "\nDirectory structure:"
# tree がインストールされていない環境でもエラーで終了しないようにする
if command -v tree >/dev/null 2>&1; then
  tree
else
  echo "(tree command not found – skipping directory tree)"
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

# 正常終了 (エラーがあっても上記で対処済みなので 0 を返す)
exit 0
