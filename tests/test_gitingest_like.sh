#!/bin/bash

# Test cases for gitingest_like.sh

# Test 1: Check if the script exits with 0 on success
test_success() {
  ../gitingest_like.sh > /dev/null
  if [ $? -eq 0 ]; then
    echo "Test 1 passed"
  else
    echo "Test 1 failed"
    exit 1
  fi
}

# Test 2: Check if the script handles empty repository
test_empty_repo() {
  rm -rf .git
  ../gitingest_like.sh > /dev/null
  if [ $? -ne 0 ]; then
    echo "Test 2 passed"
  else
    echo "Test 2 failed"
    exit 1
  fi
}

# Run the test cases
test_success
test_empty_repo
