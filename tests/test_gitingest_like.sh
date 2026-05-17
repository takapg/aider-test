#!/bin/bash

# Unit tests for gitingest_like.sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPT_PATH="$(dirname "$SCRIPT_DIR")/gitingest_like.sh"

# Test 1: Script exists and is executable
test_script_exists() {
    if [[ ! -f "$SCRIPT_PATH" ]]; then
        echo "FAIL: Script not found at $SCRIPT_PATH"
        exit 1
    fi
    echo "PASS: Script exists"
}

# Test 2: Script runs without errors
test_script_runs() {
    if ! bash "$SCRIPT_PATH" > /dev/null 2>&1; then
        echo "FAIL: Script returned non-zero exit code"
        exit 1
    fi
    echo "PASS: Script runs successfully"
}

# Test 3: Script outputs summary section
test_outputs_summary() {
    output=$(bash "$SCRIPT_PATH")
    if [[ ! "$output" =~ "Summary:" ]]; then
        echo "FAIL: Summary section not found in output"
        exit 1
    fi
    echo "PASS: Summary section present"
}

# Test 4: Script outputs repository URL
test_outputs_repo_url() {
    output=$(bash "$SCRIPT_PATH")
    if [[ ! "$output" =~ "Repository:" ]]; then
        echo "FAIL: Repository info not found in output"
        exit 1
    fi
    echo "PASS: Repository info present"
}

# Test 5: Script outputs commit hash
test_outputs_commit() {
    output=$(bash "$SCRIPT_PATH")
    if [[ ! "$output" =~ "Commit:" ]]; then
        echo "FAIL: Commit info not found in output"
        exit 1
    fi
    echo "PASS: Commit info present"
}

# Test 6: Script outputs directory structure
test_outputs_directory_structure() {
    output=$(bash "$SCRIPT_PATH")
    if [[ ! "$output" =~ "Directory structure:" ]]; then
        echo "FAIL: Directory structure section not found"
        exit 1
    fi
    echo "PASS: Directory structure section present"
}

# Test 7: Script outputs file contents section
test_outputs_files_content() {
    output=$(bash "$SCRIPT_PATH")
    if [[ ! "$output" =~ "Files Content:" ]]; then
        echo "FAIL: Files Content section not found"
        exit 1
    fi
    echo "PASS: Files Content section present"
}

# Run all tests
echo "Running tests for gitingest_like.sh..."
echo "======================================"

test_script_exists
test_script_runs
test_outputs_summary
test_outputs_repo_url
test_outputs_commit
test_outputs_directory_structure
test_outputs_files_content

echo "======================================"
echo "All tests passed!"
