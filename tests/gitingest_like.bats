#!/usr/bin/env bats

@test "gitingest_like.sh outputs summary" {
  output=$(bash ./gitingest_like.sh)
  [ "$(echo "$output" | head -n 1)" = "Summary:" ]
}

@test "gitingest_like.sh outputs repository URL" {
  output=$(bash ./gitingest_like.sh)
  [ "$(echo "$output" | head -n 2 | tail -n 1)" = "Repository: $(git remote get-url origin)" ]
}

@test "gitingest_like.sh outputs commit hash" {
  output=$(bash ./gitingest_like.sh)
  [ "$(echo "$output" | head -n 3 | tail -n 1)" = "Commit: $(git rev-parse HEAD)" ]
}

@test "gitingest_like.sh outputs number of files" {
  output=$(bash ./gitingest_like.sh)
  [ "$(echo "$output" | head -n 4 | tail -n 1)" = "Files analyzed: $(git ls-files | wc -l)" ]
}
