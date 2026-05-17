// テストテンプレート
load 'bats/load'

@test "gitingest_like.sh outputs summary" {
  run ./gitingest_like.sh
  assert_line 0 "Summary:"
}

@test "gitingest_like.sh outputs repository URL" {
  run ./gitingest_like.sh
  assert_line 1 "Repository: $(git remote get-url origin)"
}

@test "gitingest_like.sh outputs commit hash" {
  run ./gitingest_like.sh
  assert_line 2 "Commit: $(git rev-parse HEAD)"
}

@test "gitingest_like.sh outputs number of files" {
  run ./gitingest_like.sh
  assert_line 3 "Files analyzed: $(git ls-files | wc -l)"
}
