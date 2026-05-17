#!/usr/bin/env bats

setup() {
    SCRIPT_DIR="$(cd "$(dirname "$BATS_TEST_FILENAME")/.." && pwd)"
    SCRIPT="$SCRIPT_DIR/gitingest_like.sh"
}

@test "script exists and is executable" {
    [ -f "$SCRIPT" ]
    [ -x "$SCRIPT" ]
}

@test "script runs without errors" {
    run bash "$SCRIPT"
    [ "$status" -eq 0 ]
}

@test "output contains Summary section" {
    run bash "$SCRIPT"
    [[ "$output" == *"Summary:"* ]]
}

@test "output contains Repository info" {
    run bash "$SCRIPT"
    [[ "$output" == *"Repository:"* ]]
}

@test "output contains Commit info" {
    run bash "$SCRIPT"
    [[ "$output" == *"Commit:"* ]]
}

@test "output contains Files analyzed info" {
    run bash "$SCRIPT"
    [[ "$output" == *"Files analyzed:"* ]]
}

@test "output contains Directory structure section" {
    run bash "$SCRIPT"
    [[ "$output" == *"Directory structure:"* ]]
}

@test "output contains Files Content section" {
    run bash "$SCRIPT"
    [[ "$output" == *"Files Content:"* ]]
}

@test "output contains file content for aaa.txt" {
    run bash "$SCRIPT"
    [[ "$output" == *"FILE: tests/examples/01/aaa.txt"* ]]
    [[ "$output" == *"aaa"* ]]
}
