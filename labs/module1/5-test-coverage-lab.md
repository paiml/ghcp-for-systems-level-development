# Lab 5: Evaluating Test Coverage

## Overview

In this lab, you will learn how to measure test coverage, identify gaps in your tests, and use GitHub Copilot to help achieve comprehensive coverage. You'll work with the redactr microservice to ensure your code is thoroughly tested.

## Setup

Ensure you have:
- The redactr repository with your feature implementations
- GitHub Copilot enabled
- Rust and cargo installed
- Install coverage tools:
  ```bash
  cargo install cargo-tarpaulin
  # Or use cargo-llvm-cov
  cargo install cargo-llvm-cov
  ```

## Understanding Test Coverage

Test coverage measures:
- **Line Coverage**: Percentage of code lines executed during tests
- **Branch Coverage**: Percentage of conditional branches tested
- **Function Coverage**: Percentage of functions called during tests

Good coverage doesn't guarantee bug-free code, but it helps identify untested areas.

## Tasks

### Task 1: Run Coverage Analysis

1. Generate a coverage report for your project:
   ```bash
   cargo tarpaulin --out Html --output-dir coverage
   ```
   Or using llvm-cov:
   ```bash
   cargo llvm-cov --html
   ```
2. Open the generated HTML report
3. Review the coverage percentage
4. Identify files or functions with low coverage

### Task 2: Analyze Coverage Gaps

1. Find functions with less than 80% coverage
2. Identify untested code paths
3. Look for branches that aren't exercised by tests
4. Make a list of missing test scenarios
5. Note any unreachable or dead code

### Task 3: Write Tests for Gaps

1. Use GitHub Copilot to help write tests for uncovered code:
   ```rust
   // Test the error path when configuration is invalid
   #[test]
   fn test_invalid_configuration_error() {
       // Let Copilot suggest the test implementation
   }
   ```
2. Focus on one gap at a time
3. Run tests to verify they pass
4. Re-run coverage to see improvement

### Task 4: Improve Branch Coverage

1. Identify conditional statements with partial coverage
2. Write tests to exercise both branches:
   ```rust
   // Test both true and false paths of the condition
   ```
3. Use Copilot to suggest test cases for each branch
4. Verify coverage improvement

### Task 5: Test Error Paths

1. Find error handling code that isn't covered
2. Write tests that trigger error conditions:
   - Invalid inputs
   - Resource failures
   - Edge cases
3. Use Copilot to help generate error scenarios
4. Ensure error messages are tested

### Task 6: Review with Copilot Chat

1. Ask Copilot Chat: "What test cases am I missing for [function_name]?"
2. Request suggestions for improving coverage
3. Ask about edge cases you might have missed
4. Implement suggested tests

### Task 7: Set Coverage Goals

1. Run final coverage analysis
2. Document your coverage metrics:
   - Overall coverage percentage
   - Per-module coverage
   - Functions with 100% coverage
   - Areas still needing work
3. Set a target coverage goal (e.g., 80% overall, 90% for core logic)

## Expected Outcomes

By the end of this lab, you should:
- Know how to measure test coverage
- Be able to identify and fill coverage gaps
- Understand the relationship between coverage and code quality
- Have significantly improved coverage for your project

## Best Practices

- Aim for 80%+ coverage on critical code paths
- Don't chase 100% coverage at the expense of test quality
- Focus on testing behavior, not just lines of code
- Exclude trivial getters/setters from coverage requirements
- Test edge cases and error paths thoroughly

## Deliverables

1. Coverage report showing improvement from baseline
2. At least 80% overall test coverage
3. 90%+ coverage on core business logic
4. Documentation of coverage gaps and remediation plan

## Coverage Analysis Questions

For each uncovered section, ask:
1. Is this code reachable?
2. What conditions must be true to execute this?
3. Is this an error path that should be tested?
4. Can this code be simplified or refactored?

## Reflection Questions

1. What was your initial coverage percentage vs. final?
2. What types of code were most commonly untested?
3. Did you find any bugs while improving coverage?
4. How did Copilot help identify missing test cases?
5. What's a reasonable coverage target for your project?

## Advanced Topics

If time permits, explore:
1. **Mutation Testing**: Test the quality of your tests
2. **Property-Based Testing**: Generate random test cases
3. **Fuzzing**: Find edge cases automatically
4. **Continuous Coverage**: Track coverage over time in CI/CD

## Next Steps

You've completed the TDD module! In the next module, you'll learn strategies for working with large codebases using GitHub Copilot's workspace features.
