# Makefile for gitingest_like.sh utility

# Define the main script and test script
SCRIPT := gitingest_like.sh
TEST_SCRIPT := test_gitingest_like.sh

.PHONY: all test run clean

# Default target: runs the tests
all: test

# Target to run the tests
test:
	@echo "==================================================="
	@echo "Running comprehensive test suite for $(SCRIPT)"
	@echo "==================================================="
	./$(TEST_SCRIPT)

# Target to run the main utility script
run:
	@echo "==================================================="
	@echo "Running $(SCRIPT) (Requires arguments, e.g., ./$(SCRIPT) <name>)"
	@echo "==================================================="
	# Example usage: If you want to test the script's basic functionality
	# ./$(SCRIPT) TestUser

# Target to clean up any generated files (if applicable)
clean:
	@echo "Cleaning up build artifacts..."
	# Add cleanup commands here if the script generates temporary files
