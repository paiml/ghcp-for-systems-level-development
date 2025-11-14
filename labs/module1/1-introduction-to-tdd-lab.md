# Lab 1: Introduction to AI-Assisted TDD

## Overview

In this lab, you will learn the fundamentals of test-driven development (TDD) while leveraging GitHub Copilot to accelerate the process. You'll work with the redactr Rust microservice to implement new features using a test-first approach.

## Setup

1. Install GitHub Copilot extension in your preferred IDE (VS Code, JetBrains, or other supported IDEs)
2. Ensure you have an active GitHub account with Copilot access
3. Clone the redactr repository:
   ```bash
   git clone https://github.com/alfredodeza/redactr.git
   cd redactr
   ```
4. Install Rust and ensure you can run tests:
   ```bash
   cargo test
   ```

## Understanding the TDD Workflow

Test-Driven Development follows this cycle:
1. **Write a failing test** - Define what you want to implement
2. **Run the test** - Verify that it fails
3. **Write minimal code** - Make the test pass
4. **Run the test again** - Verify it passes
5. **Refactor** - Improve the code while keeping tests passing

## Tasks

### Task 1: Explore Existing Tests

1. Open the test file in the redactr project
2. Run the existing tests to ensure everything passes:
   ```bash
   cargo test
   ```
3. Review how existing tests are structured
4. Note the naming conventions and test patterns used

### Task 2: Write a Failing Test

1. Identify a simple feature enhancement (e.g., accepting "1" as a true value for a boolean conversion)
2. Write a test for this feature BEFORE implementing it
3. Use GitHub Copilot to help generate test boilerplate by starting to type the test function
4. Run the test and verify it fails:
   ```bash
   cargo test
   ```

### Task 3: Implement the Feature

1. Navigate to the implementation file
2. Use GitHub Copilot suggestions to implement the feature
3. Accept or refine Copilot's suggestions to make your test pass
4. Save the file

### Task 4: Verify and Refactor

1. Run the tests again and verify your new test passes:
   ```bash
   cargo test
   ```
2. Review the implementation and refactor if needed
3. Use Copilot to suggest improvements or optimizations
4. Ensure all tests still pass after refactoring

### Task 5: Experiment with Context

1. Notice how Copilot provides better suggestions when you have related files open
2. Jump between test and implementation files
3. Observe how context awareness improves Copilot's suggestions

## Expected Outcomes

By the end of this lab, you should:
- Understand the TDD workflow (Red-Green-Refactor)
- Know how to write tests before implementation
- Be able to leverage Copilot for test generation
- Recognize how Copilot uses context from open files

## Reflection Questions

1. How did GitHub Copilot's suggestions change as you moved between files?
2. What was the benefit of writing the test first?
3. How confident are you that your feature works correctly? Why?

## Next Steps

In the next lab, you'll learn how to generate more complex test suites, including edge cases and error handling scenarios.
