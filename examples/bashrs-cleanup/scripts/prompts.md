# GitHub Copilot Prompts for Shell Script Cleanup

This document shows the exact prompts used to transform `messy-deploy.sh` into `clean-deploy.sh`.

## Initial Analysis Prompt

```
Analyze this bash script and identify quality issues using bashrs best practices.
Focus on:
- Variable quoting
- Error handling
- Input validation
- Code organization
```

## Improvement Prompts (In Order)

### 1. Add Strict Error Handling

```
Add `set -euo pipefail` to the beginning of the script and explain what each flag does.
```

**Result**: Enables strict error checking

### 2. Improve Variable Quoting

```
Quote all variable references to handle spaces and special characters correctly.
Use double quotes around all variable expansions.
```

**Result**: All variables properly quoted

### 3. Add Input Validation

```
Create a `validate_args()` function that:
- Checks if required arguments are provided
- Validates the directory exists
- Ensures environment is one of: dev, staging, prod
- Shows helpful error messages
```

**Result**: Robust argument validation

### 4. Extract Configuration

```
Move all hardcoded values to readonly variables at the top of the script.
Use descriptive names like WEB_ROOT, SERVICE_NAME, etc.
```

**Result**: Configuration separated from logic

### 5. Create Modular Functions

```
Refactor the script into small, focused functions:
- update_repository()
- install_dependencies()
- deploy_production()
- main()

Each function should do one thing well.
```

**Result**: Modular, testable code

### 6. Add Usage Documentation

```
Create a usage() function that displays:
- Script name
- Required arguments
- Example usage
- Clear formatting with a heredoc
```

**Result**: Self-documenting script

### 7. Improve Error Messages

```
Update all error messages to:
- Write to stderr using >&2
- Include context about what failed
- Suggest how to fix the issue
```

**Result**: Helpful error reporting

### 8. Add Descriptive Comments

```
Add comments that explain:
- What each function does (not how)
- Why decisions were made
- Configuration sections
```

**Result**: Maintainable documentation

## Iterative Refinement

After initial improvements, use these prompts for refinement:

```
Run bashrs lint on this script and fix any remaining issues.
```

```
Review the script for any remaining shellcheck warnings.
```

```
Ensure all function parameters are properly quoted and validated.
```

## Testing Prompt

```
Create a test script that validates both versions produce identical behavior
for common use cases.
```

## Key Lessons

1. **Start with error handling** - Prevents silent failures
2. **Quote everything** - Handles edge cases with spaces
3. **Validate early** - Fail fast with helpful messages
4. **Extract functions** - Makes code reusable and testable
5. **Document usage** - Reduces support burden
6. **Iterate with tools** - Use bashrs/shellcheck to verify improvements

## Before and After Comparison

### Messy Version Issues
- No error handling
- Unquoted variables
- Cryptic variable names (`$d`, `$e`)
- Missing input validation
- Hardcoded paths
- Monolithic code

### Clean Version Improvements
- ✅ `set -euo pipefail` error handling
- ✅ All variables properly quoted
- ✅ Descriptive names (`project_dir`, `environment`)
- ✅ Comprehensive input validation
- ✅ Configuration constants at top
- ✅ Modular functions
- ✅ Usage documentation
- ✅ Proper exit codes
- ✅ stderr for errors
