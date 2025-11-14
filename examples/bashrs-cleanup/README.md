# bashrs Cleanup Example

This example demonstrates using GitHub Copilot to improve shell script quality with the bashrs linting tool.

## Overview

Learn how to use GitHub Copilot prompts to transform a messy shell script into clean, production-ready code following best practices.

## What's Included

- **messy-deploy.sh** - Original script with common quality issues
- **clean-deploy.sh** - Improved version following best practices
- **prompts.md** - GitHub Copilot prompts used for the transformation
- **test-scripts.sh** - Validation tests ensuring both versions work identically

## Common Quality Issues Demonstrated

The messy script shows typical problems:

1. **Poor variable quoting** - Unquoted variables that break with spaces
2. **Inconsistent indentation** - Mix of tabs and spaces
3. **Missing error handling** - No checks for command failures
4. **Unclear variable names** - Single-letter or cryptic names
5. **No input validation** - Missing checks for required arguments
6. **Hardcoded values** - Configuration mixed with logic
7. **Poor function organization** - Monolithic script without functions

## Quality Improvements

The clean script demonstrates:

1. **Proper quoting** - All variables quoted to handle spaces
2. **Consistent style** - Uniform indentation and formatting
3. **Error handling** - `set -euo pipefail` and explicit checks
4. **Descriptive names** - Clear, self-documenting variable names
5. **Input validation** - Argument checking and usage messages
6. **Configuration separation** - Variables at the top
7. **Modular functions** - Reusable, testable code blocks

## Using This Example

### 1. Examine the Messy Script

```bash
cat scripts/messy-deploy.sh
bashrs lint scripts/messy-deploy.sh
```

Note the quality issues reported by bashrs.

### 2. Review the Clean Script

```bash
cat scripts/clean-deploy.sh
bashrs lint scripts/clean-deploy.sh
```

See how the issues have been resolved.

### 3. Compare Functionality

```bash
bash tests/test-scripts.sh
```

Both scripts produce identical output despite quality differences.

### 4. Study the Prompts

```bash
cat scripts/prompts.md
```

Learn the exact GitHub Copilot prompts used for the transformation.

## Key Takeaways

- **Quality tools like bashrs catch common mistakes**
- **GitHub Copilot can suggest best practices**
- **Iterative prompting improves results**
- **Functional equivalence is maintained through testing**

## Related Lab

See `labs/bonus/bonus1-bashrs-cleanup.md` for the full hands-on exercise.

## Tools Used

- **GitHub Copilot** - AI-assisted code improvement
- **bashrs** - Shell script linting and formatting
- **bash** - Script execution and testing
