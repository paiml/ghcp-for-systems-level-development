# Lab 3: Mocking Dependencies with Copilot

## Overview

In this lab, you will learn how to use GitHub Copilot to help create mock objects and test doubles for isolating components during testing. This is essential for unit testing code with external dependencies.

## Setup

Ensure you have:
- The redactr repository ready for testing
- GitHub Copilot enabled
- Understanding of TDD workflows from previous labs
- Consider installing a mocking library for Rust (e.g., `mockall` or `mockito`)

## Understanding Mocking

Mocking allows you to:
- Test components in isolation
- Simulate external dependencies (databases, APIs, file systems)
- Control test conditions precisely
- Speed up test execution by avoiding slow operations

## Tasks

### Task 1: Identify Dependencies to Mock

1. Review the redactr codebase for external dependencies
2. Identify functions that interact with:
   - File system operations
   - HTTP requests/responses
   - Configuration files
   - External services
3. Select one dependency to mock for testing

### Task 2: Set Up Mocking Framework

1. Add a mocking crate to your `Cargo.toml`:
   ```toml
   [dev-dependencies]
   mockall = "0.11"
   ```
2. Use Copilot to help generate the import statements
3. Review the mocking framework documentation

### Task 3: Create Mock Objects

1. Write a comment describing what you want to mock:
   ```rust
   // Create a mock for the HTTP client
   // Mock should return predefined responses
   ```
2. Let GitHub Copilot generate the mock structure
3. Refine the mock to match your testing needs
4. Verify the mock compiles correctly

### Task 4: Write Tests Using Mocks

1. Create a test that uses your mock object
2. Use Copilot to help set up the test environment:
   ```rust
   #[test]
   fn test_with_mocked_dependency() {
       // Set up mock
       // Configure expected behavior
       // Call function under test
       // Assert results
   }
   ```
3. Run the test and verify it passes
4. Ensure the mock is being used correctly

### Task 5: Test Different Scenarios

1. Use the mock to simulate different scenarios:
   - Successful operations
   - Network failures
   - Timeout conditions
   - Invalid responses
2. Let Copilot help generate variations
3. Verify each scenario is tested properly

### Task 6: Refactor for Testability

1. If needed, refactor code to accept dependencies as parameters
2. Use dependency injection patterns
3. Let Copilot suggest refactoring approaches
4. Ensure all tests still pass after refactoring

## Expected Outcomes

By the end of this lab, you should:
- Understand when and why to use mocks
- Be able to create mock objects with Copilot assistance
- Know how to test components in isolation
- Have tests that run quickly without external dependencies

## Best Practices

- Mock only what you need
- Keep mocks simple and focused
- Document what each mock simulates
- Prefer real dependencies for integration tests
- Use mocks primarily for unit tests

## Reflection Questions

1. How did mocking improve your test reliability?
2. What challenges did you encounter when creating mocks?
3. How did Copilot help you understand the mocking framework?
4. When would you choose NOT to use a mock?

## Next Steps

In the next lab, you'll face a challenge: implement a complete new feature using TDD from start to finish.
