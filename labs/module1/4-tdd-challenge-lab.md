# Lab 4: Challenge - TDD for a New Feature

## Overview

This is a challenge lab where you'll implement a complete new feature for the redactr microservice using test-driven development from start to finish. You'll apply everything you've learned in the previous labs.

## Setup

Ensure you have:
- The redactr repository ready
- GitHub Copilot enabled
- Confidence with the TDD workflow
- Knowledge of mocking and test generation techniques

## The Challenge

Implement a new feature for the redactr service that allows users to specify custom redaction patterns via configuration.

### Requirements

1. The service should accept custom regex patterns
2. Patterns should be loadable from a configuration file
3. Each pattern should specify what to redact and what to replace it with
4. The feature should maintain backward compatibility
5. All functionality must be test-driven

## Tasks

### Task 1: Plan Your Approach

1. Break down the feature into smaller components
2. Identify the order in which to implement features
3. List the tests you'll need to write
4. Consider edge cases and error scenarios
5. **Do not write any production code yet**

### Task 2: Write Your First Test

1. Start with the simplest test case
2. Use GitHub Copilot to help structure the test
3. Write a test for loading a configuration file
4. Run the test and verify it fails (Red phase)
5. Document why the test fails

### Task 3: Implement Minimal Code

1. Write just enough code to make the first test pass
2. Use Copilot suggestions but verify each suggestion
3. Avoid over-engineering - keep it simple
4. Run the test and verify it passes (Green phase)
5. Commit your changes

### Task 4: Refactor

1. Review your implementation for improvements
2. Use Copilot to suggest refactoring opportunities
3. Ensure tests still pass after refactoring
4. Commit your changes

### Task 5: Repeat the Cycle

1. Write the next test (another failing test)
2. Implement minimal code to pass it
3. Refactor as needed
4. Repeat until the feature is complete

### Task 6: Add Edge Cases

1. Write tests for:
   - Empty configuration files
   - Invalid regex patterns
   - Missing configuration files
   - Malformed JSON/YAML
2. Implement error handling for each case
3. Verify all tests pass

### Task 7: Integration Testing

1. Write an integration test that uses the complete feature
2. Test the feature end-to-end
3. Verify it works with the existing redaction logic
4. Ensure backward compatibility

## Success Criteria

Your implementation should:
- [ ] Have all tests passing
- [ ] Include at least 10 tests covering different scenarios
- [ ] Handle error cases gracefully
- [ ] Maintain backward compatibility
- [ ] Have clean, readable code
- [ ] Include documentation/comments
- [ ] Follow Rust best practices

## Constraints

- **You must write tests before implementation**
- Each test should initially fail
- Commit after each Red-Green-Refactor cycle
- Use Copilot but verify all suggestions
- Do not skip error handling

## Expected Outcomes

By the end of this lab, you should:
- Have a complete feature implemented via TDD
- Demonstrate mastery of the TDD workflow
- Show effective use of GitHub Copilot in development
- Have a well-tested, robust feature

## Bonus Challenges

If you finish early:
1. Add support for multiple configuration formats (JSON, YAML, TOML)
2. Implement configuration hot-reloading
3. Add performance tests for large configuration files
4. Create benchmarks for pattern matching

## Reflection Questions

1. How many times did you go through the Red-Green-Refactor cycle?
2. What was the most challenging test to write?
3. How did Copilot help you identify edge cases?
4. Would you have designed the feature differently without TDD?
5. How confident are you in your implementation? Why?


## Next Steps

In the next lab, you'll learn how to evaluate and improve test coverage for your implementation.
