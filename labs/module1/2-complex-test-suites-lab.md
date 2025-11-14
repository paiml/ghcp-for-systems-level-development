# Lab 2: Generating Complex Test Suites

## Overview

In this lab, you will learn how to use GitHub Copilot to generate comprehensive test suites that cover edge cases, error conditions, and various input scenarios. You'll work with the redactr microservice to create robust test coverage.

## Setup

Ensure you have:
- The redactr repository cloned and tests running
- GitHub Copilot enabled in your IDE
- Familiarity with the TDD workflow from Lab 1

## Understanding Complex Test Suites

A comprehensive test suite should include:
- **Happy path tests** - Expected normal operation
- **Edge cases** - Boundary conditions and unusual inputs
- **Error cases** - Invalid inputs and error handling
- **Performance tests** - Resource usage and efficiency (optional)

## Tasks

### Task 1: Analyze Current Test Coverage

1. Review existing tests in the redactr project
2. Identify areas with limited test coverage
3. Make a list of untested scenarios or edge cases
4. Run tests with coverage reporting:
   ```bash
   cargo test
   # For coverage analysis, you may need to install cargo-tarpaulin
   # cargo install cargo-tarpaulin
   # cargo tarpaulin --out Html
   ```

### Task 2: Generate Edge Case Tests

1. Select a function that handles string input
2. Write a comment describing edge cases you want to test:
   ```rust
   // Test empty string input
   // Test very long string input
   // Test special characters and unicode
   ```
3. Let GitHub Copilot generate test cases based on your comments
4. Review and refine the generated tests
5. Run the tests to verify they work correctly

### Task 3: Create Error Handling Tests

1. Identify functions that should handle invalid input gracefully
2. Use Copilot to generate tests for error scenarios:
   - Invalid JSON format
   - Missing required fields
   - Type mismatches
3. Implement error handling if it doesn't exist
4. Verify tests pass with proper error handling

### Task 4: Generate Parameterized Tests

1. Create a test that runs multiple scenarios with different inputs
2. Use Rust's testing features or a crate like `rstest` for parameterized tests
3. Let Copilot help generate test cases with various input combinations:
   ```rust
   #[test]
   fn test_multiple_scenarios() {
       // Let Copilot suggest multiple test cases
   }
   ```
4. Verify all scenarios are tested

### Task 5: Refine with Copilot Chat

1. Use Copilot Chat to ask: "What edge cases am I missing for this function?"
2. Implement suggested test cases
3. Ask: "How can I improve the robustness of these tests?"
4. Apply suggestions and verify improvements

## Expected Outcomes

By the end of this lab, you should:
- Be able to generate comprehensive test suites with Copilot
- Know how to identify and test edge cases
- Understand error handling test patterns
- Have significantly improved test coverage

## Deliverables

1. At least 5 new edge case tests
2. At least 3 error handling tests
3. All tests passing
4. Documented test coverage improvements

## Reflection Questions

1. What edge cases did Copilot suggest that you hadn't considered?
2. How did using comments as prompts help Copilot generate better tests?
3. What percentage of test coverage did you achieve?

## Next Steps

In the next lab, you'll learn how to mock dependencies and test isolated components using GitHub Copilot.
