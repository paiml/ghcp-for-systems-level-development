# Lab 8: System-Wide Code Cleanup

## Overview

In this lab, you will learn how to use GitHub Copilot to perform systematic code cleanup and refactoring across multiple files in a large codebase. You'll identify inconsistencies, remove duplication, and improve code quality at scale.

## Setup

Continue with your large codebase from previous labs, or use the redactr repository if you prefer a smaller, more manageable project for this exercise.

Ensure you have:
- GitHub Copilot with workspace support
- Git for tracking changes
- A backup branch or clean git state
- Understanding of the codebase structure from previous labs

## Understanding System-Wide Cleanup

System-wide cleanup addresses:
- **Code duplication**: Repeated logic across files
- **Inconsistent naming**: Variables, functions with different conventions
- **Outdated patterns**: Old APIs or deprecated approaches
- **Dead code**: Unused functions, imports, variables
- **Style inconsistencies**: Mixed formatting, conventions

## Tasks

### Task 1: Identify Code Duplication

1. Ask Copilot to find duplicated code:
   ```
   "@workspace Are there any duplicated functions or code blocks?"
   ```
2. Manually review a few files for repeated patterns
3. Select one instance of duplication to refactor
4. Document all occurrences

### Task 2: Extract Shared Functionality

1. Choose a duplicated code block
2. Ask Copilot to help create a shared utility:
   ```
   "Extract this repeated code into a reusable function"
   ```
3. Create a new utility file or add to an existing one
4. Write tests for the new shared function
5. Replace all duplicated instances with calls to the new function

### Task 3: Standardize Naming Conventions

1. Identify inconsistent naming patterns:
   ```
   "@workspace What naming conventions are used for variables?"
   ```
2. Choose a standard convention (camelCase, snake_case, etc.)
3. Find all instances that don't follow the convention
4. Use Copilot to help rename consistently:
   ```
   "Rename all instances of 'userData' to 'user_data'"
   ```
5. Use your IDE's refactoring tools to ensure all references are updated

### Task 5: Update Patterns

Depending on the codebase, patterns might not be deprecated, but you can ask
for an optimization in patterns in the current codebase.

1. Find old or deprecated API usage:
   ```
   "@workspace Are there any deprecated function calls or updates I can make?"
   ```
2. For each deprecated usage, ask for the modern equivalent:
   ```
   "What's the recommended replacement for [deprecated_function]?"
   ```
3. Update code to use current best practices
4. Test to ensure functionality is preserved

### Task 6: Consistent Error Handling

1. Review error handling patterns across the codebase:
   ```
   "@workspace How is error handling implemented across different modules?"
   ```
2. Identify inconsistencies (some use exceptions, some return error codes, etc.)
3. Choose a consistent approach
4. Refactor error handling to follow the pattern:
   ```
   "Refactor this error handling to use Result types consistently"
   ```
5. Test error paths thoroughly

### Task 7: Run Tests and Verify

1. Run your full test suite after each major change
2. Fix any broken tests
3. Add new tests for refactored code
4. Verify functionality manually if needed
5. Commit changes in logical groups

## Expected Outcomes

By the end of this lab, you should:
- Have removed code duplication
- Standardized naming and patterns
- Eliminated dead code
- Updated deprecated APIs
- Improved overall code quality

## Safety Guidelines

**Important**: System-wide changes can introduce bugs!

1. **Use Version Control**: Commit frequently with clear messages
2. **Test Continuously**: Run tests after each change
3. **Small Batches**: Make incremental changes, not massive refactors
4. **Peer Review**: Have changes reviewed before merging
5. **Feature Flags**: Use flags for risky changes in production code
6. **Rollback Plan**: Know how to revert changes quickly

## Refactoring Checklist

Before making changes:
- [ ] Understand the current code behavior
- [ ] Have tests covering the code
- [ ] Create a backup branch
- [ ] Document what you're changing and why

During changes:
- [ ] Make one type of change at a time
- [ ] Run tests frequently
- [ ] Commit small, logical changes
- [ ] Use descriptive commit messages

After changes:
- [ ] Verify all tests pass
- [ ] Check for unintended side effects
- [ ] Update documentation
- [ ] Request code review

## Deliverables

Create a cleanup report:
1. **Before/After Metrics**:
   - Lines of code reduced
   - Number of duplications eliminated
   - Dead code removed
2. **Changes Made**:
   - List of refactorings performed
   - Files modified
   - Patterns standardized
3. **Test Results**: All tests passing
4. **Git History**: Clean commit history showing incremental changes

## Reflection Questions

1. What was the most common type of duplication you found?
2. How did Copilot help identify cleanup opportunities?
3. What challenges did you face during refactoring?
4. How do you prevent these issues in the future?
5. What's the risk/benefit ratio of large-scale refactoring?

## Common Cleanup Patterns

| Issue | Solution | Risk Level |
|-------|----------|-----------|
| Unused imports | Remove | Low |
| Code duplication | Extract to function | Medium |
| Inconsistent naming | Rename with IDE refactoring | Medium |
| Deprecated APIs | Update to modern API | Medium-High |
| Dead code | Remove (with verification) | Medium |
| Global state | Refactor to dependency injection | High |

## Advanced Exercise

If time permits:
1. Set up automated linting to prevent future issues
2. Create a style guide based on your standardization
3. Add pre-commit hooks to enforce standards
4. Use Copilot to help write cleanup scripts

## Next Steps

In the next lab, you'll learn how to enforce coding styles and constraints to maintain code quality going forward.
