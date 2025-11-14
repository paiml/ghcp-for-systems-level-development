# Bonus Lab 1: Shell Script Quality with bashrs and GitHub Copilot

## Overview

In this lab, you will learn how to use GitHub Copilot to transform messy shell scripts into production-ready code following industry best practices. You'll leverage the bashrs linting tool to identify quality issues and use AI-assisted prompting to systematically improve shell script quality.

Shell scripts are critical infrastructure code that often accumulates technical debt. This lab teaches you how to recognize common quality issues and use modern tools to address them efficiently.

## Setup

1. Ensure you have GitHub Copilot extension installed and active
2. Install bashrs (Rust-based shell script linter):
   ```bash
   cargo install bashrs
   ```
3. Verify installation:
   ```bash
   bashrs --version
   ```
4. Navigate to the example directory:
   ```bash
   cd examples/bashrs-cleanup
   ```
5. Familiarize yourself with the directory structure:
   ```bash
   tree .
   ```

## Understanding Shell Script Quality

Shell scripts are prone to several categories of issues that bashrs helps identify:

### Common Quality Issues

1. **Variable Quoting**: Unquoted variables break with spaces or special characters
2. **Error Handling**: Scripts continue after failures, hiding problems
3. **Input Validation**: Missing checks for required arguments or invalid values
4. **Naming Conventions**: Cryptic variable names reduce maintainability
5. **Code Organization**: Monolithic scripts are hard to test and reuse
6. **Configuration Management**: Hardcoded values mixed with logic
7. **Style Consistency**: Inconsistent indentation and formatting

### Quality Best Practices

The clean script demonstrates these improvements:

1. **Strict Error Mode**: Using `set -euo pipefail` for fail-fast behavior
2. **Proper Quoting**: All variables quoted to handle edge cases
3. **Descriptive Names**: Self-documenting variable and function names
4. **Input Validation**: Early validation with helpful error messages
5. **Modular Functions**: Single-responsibility functions for testability
6. **Configuration Constants**: Readonly variables separated from logic
7. **Usage Documentation**: Self-documenting help messages

## Tasks

### Task 1: Analyze the Messy Script

1. Examine the original script with quality issues:
   ```bash
   cat scripts/messy-deploy.sh
   ```

2. Run bashrs lint to identify all quality issues:
   ```bash
   bashrs lint scripts/messy-deploy.sh
   ```

3. Document the issues you observe (both from bashrs and manual review):
   - Count the number of unquoted variables
   - Identify missing error handling
   - Note unclear variable names
   - List hardcoded values
   - Find any missing input validation

4. Try to mentally categorize issues by severity:
   - **Critical**: Will cause failures in production
   - **High**: Will cause failures in edge cases
   - **Medium**: Reduces maintainability
   - **Low**: Style inconsistencies

**Expected Issues to Find:**
- Unquoted variables: `$d`, `$e`
- Missing error handling: No `set -euo pipefail`
- Poor variable names: `$d`, `$e` are not descriptive
- Weak validation: Only checks if `$d` is empty, not if directory exists
- Hardcoded paths: `/var/www/html` embedded in logic
- Missing environment validation: `$e == "prod"` doesn't validate other values
- No usage documentation: Users must read code to understand usage

### Task 2: Study the Clean Version

1. Review the improved script:
   ```bash
   cat scripts/clean-deploy.sh
   ```

2. Run bashrs lint on the clean version:
   ```bash
   bashrs lint scripts/clean-deploy.sh
   ```

3. Compare the results:
   - What issues were resolved?
   - What new patterns were introduced?
   - How is the code organized differently?

4. Examine the transformation prompts:
   ```bash
   cat scripts/prompts.md
   ```

5. Understand the systematic improvement process:
   - Notice the order of improvements (error handling first)
   - See how each prompt targets a specific quality issue
   - Observe the iterative refinement approach

**Key Improvements to Notice:**
- `set -euo pipefail` at the top
- Readonly configuration variables
- Comprehensive `validate_args()` function
- Modular function structure
- `usage()` function with heredoc
- Proper error messages to stderr
- Descriptive variable names throughout

### Task 3: Use GitHub Copilot for Guided Improvement

Now you'll practice the improvement process yourself.

1. Create a working copy of the messy script:
   ```bash
   cp scripts/messy-deploy.sh scripts/my-deploy.sh
   ```

2. Open `scripts/my-deploy.sh` in your editor with Copilot enabled

3. Follow the systematic improvement process from `prompts.md`:

   **Step 1: Add Strict Error Handling**
   - Place cursor at the top of the script
   - Ask Copilot: "Add set -euo pipefail to the beginning and explain each flag"
   - Accept the suggestion and add comments explaining each flag
   - Save the file

   **Step 2: Improve Variable Quoting**
   - Select an unquoted variable (e.g., `$d`)
   - Ask Copilot: "Quote all variable references to handle spaces correctly"
   - Review suggestions and apply to all variables
   - Run bashrs lint to verify: `bashrs lint scripts/my-deploy.sh`

   **Step 3: Add Input Validation**
   - Position cursor after the configuration section
   - Ask Copilot: "Create a validate_args() function that checks if arguments are provided, validates directory exists, and ensures environment is dev, staging, or prod"
   - Review the generated function
   - Add a call to validate_args at the start of the script

   **Step 4: Extract Configuration**
   - Select the hardcoded `/var/www/html` path
   - Ask Copilot: "Move all hardcoded values to readonly variables at the top"
   - Accept suggestions for WEB_ROOT, SERVICE_NAME, etc.
   - Verify all hardcoded values are extracted

   **Step 5: Create Modular Functions**
   - Select the git pull and npm install commands
   - Ask Copilot: "Extract these commands into focused functions: update_repository(), install_dependencies(), deploy_production()"
   - Review each generated function
   - Ensure functions have clear parameters and responsibilities

   **Step 6: Add Usage Documentation**
   - At the top of the script, after configuration
   - Ask Copilot: "Create a usage() function that displays script name, required arguments, and example usage using a heredoc"
   - Review the generated documentation
   - Ensure it matches your script's actual interface

4. After each step, verify your changes:
   ```bash
   bashrs lint scripts/my-deploy.sh
   ```

5. Test the syntax of your improved script:
   ```bash
   bash -n scripts/my-deploy.sh
   ```

### Task 4: Compare Before and After

1. Use diff to see all changes:
   ```bash
   diff -u scripts/messy-deploy.sh scripts/my-deploy.sh
   ```

2. Count lines of code:
   ```bash
   wc -l scripts/messy-deploy.sh scripts/my-deploy.sh
   ```

3. Run bashrs lint on both and compare:
   ```bash
   bashrs lint scripts/messy-deploy.sh > messy-lint.txt 2>&1
   bashrs lint scripts/my-deploy.sh > clean-lint.txt 2>&1
   diff -u messy-lint.txt clean-lint.txt
   ```

4. Document your improvements:
   - Number of bashrs issues resolved
   - Number of functions created
   - Improvement in code organization
   - Enhanced error handling capabilities

**Metrics to Track:**
- Original lines of code vs. final (more lines is okay if more maintainable)
- Number of bashrs warnings: before vs. after
- Number of functions: before vs. after
- Test coverage: can functions be unit tested now?

### Task 5: Create Your Own Shell Script Improvement

Now apply your skills to a new scenario.

1. Create a new messy script for a database backup scenario:
   ```bash
   cat > scripts/my-backup.sh << 'EOF'
   #!/bin/bash
   db=$1
   file=$2

   if [ -z $db ]; then
   echo "need db name"
   exit 1
   fi

   mysqldump -u root $db > $file
   gzip $file
   cp $file.gz /backups

   echo backup complete
   EOF
   chmod +x scripts/my-backup.sh
   ```

2. Run bashrs lint to identify issues:
   ```bash
   bashrs lint scripts/my-backup.sh
   ```

3. Use GitHub Copilot to systematically improve it:
   - Add error handling
   - Quote variables
   - Validate inputs (check if database exists, validate file path)
   - Add configuration (backup directory, mysql credentials path)
   - Create modular functions (dump_database, compress_backup, store_backup)
   - Add usage documentation
   - Handle edge cases (disk space, permissions, mysql connection)

4. Document your improvement process:
   - List the prompts you used
   - Explain the order you chose and why
   - Note which improvements had the biggest impact

5. Verify your improvements:
   ```bash
   bashrs lint scripts/my-backup.sh
   bash -n scripts/my-backup.sh
   ```

**Advanced Challenges:**
- Add logging with timestamps
- Implement backup rotation (keep only last N backups)
- Add email notifications on failure
- Support multiple database types (postgres, mysql, sqlite)
- Add dry-run mode for testing
- Implement parallel compression for large databases

### Task 6: Write Tests for Shell Scripts

Quality scripts should be testable. Create validation tests.

1. Study the existing test structure:
   ```bash
   cat tests/test-scripts.sh
   ```

2. Create tests for your improved backup script:
   ```bash
   cat > tests/test-my-backup.sh << 'EOF'
   #!/bin/bash
   # Tests for my-backup.sh

   set -euo pipefail

   SCRIPT_DIR="$(cd "$(dirname "$0")/../scripts" && pwd)"
   PASSED=0
   FAILED=0

   # Helper function
   test_result() {
       local test_name="$1"
       local result="$2"

       if [[ "$result" == "true" ]]; then
           echo "✓ $test_name"
           ((PASSED++))
       else
           echo "✗ $test_name"
           ((FAILED++))
       fi
   }

   # Test 1: Script shows usage when no args
   # TODO: Add your tests here

   # Summary
   echo ""
   echo "================================"
   echo "Passed: ${PASSED}"
   echo "Failed: ${FAILED}"
   echo "================================"

   [[ ${FAILED} -eq 0 ]] && exit 0 || exit 1
   EOF
   chmod +x tests/test-my-backup.sh
   ```

3. Ask Copilot to help write comprehensive tests:
   - Usage message display
   - Error handling for missing arguments
   - Error handling for invalid database names
   - Function existence and executability
   - Syntax validation

4. Run your test suite:
   ```bash
   bash tests/test-my-backup.sh
   ```

**Testing Best Practices:**
- Test error cases, not just happy path
- Verify error messages go to stderr
- Check exit codes (0 for success, non-zero for failure)
- Test with edge cases (spaces in names, special characters)
- Use temporary directories for file system tests
- Mock external dependencies (databases, network calls)

## Expected Outcomes

By the end of this lab, you should be able to:

1. **Identify Shell Script Quality Issues**:
   - Recognize unquoted variables
   - Spot missing error handling
   - Identify poor code organization
   - Find input validation gaps

2. **Use bashrs Effectively**:
   - Run bashrs lint to find issues
   - Interpret bashrs warnings and errors
   - Verify improvements with bashrs

3. **Leverage GitHub Copilot for Improvement**:
   - Write effective prompts for systematic improvement
   - Apply improvements in the right order
   - Iterate with tool feedback
   - Generate comprehensive documentation

4. **Apply Best Practices**:
   - Implement proper error handling
   - Structure code with modular functions
   - Validate inputs thoroughly
   - Write self-documenting code

5. **Test Shell Scripts**:
   - Write validation tests
   - Test error conditions
   - Verify script behavior

## Deliverables

Create a summary document with:

1. **Before/After Comparison**:
   - Original script and final version
   - bashrs lint output for both
   - List of improvements made

2. **Improvement Process**:
   - Prompts used for each improvement
   - Order of improvements and rationale
   - Challenges encountered and solutions

3. **Test Results**:
   - Test script for your improvements
   - All tests passing
   - Coverage of edge cases

4. **Quality Metrics**:
   - Number of bashrs issues resolved
   - Functions created
   - Lines of code (before/after)
   - Percentage of code that is now testable

## Reflection Questions

1. What types of quality issues were most common in the messy script?
2. How did the order of improvements affect the process?
3. Which improvement had the biggest impact on maintainability?
4. How did GitHub Copilot's suggestions change as you provided more context?
5. What would you add to a shell script style guide based on this exercise?
6. How can you prevent these quality issues in new shell scripts?
7. What's the trade-off between script simplicity and robustness?

## Common Shell Script Pitfalls

| Issue | Example | Fix |
|-------|---------|-----|
| Unquoted variables | `cd $dir` | `cd "${dir}"` |
| No error handling | Default behavior | `set -euo pipefail` |
| Weak validation | `[ -z $1 ]` | `[[ -z "${1:-}" ]]` && check existence |
| Cryptic names | `$d`, `$e`, `$x` | `$project_dir`, `$environment` |
| Hardcoded paths | `/var/www/html` | `readonly WEB_ROOT="/var/www/html"` |
| No usage docs | Comments only | `usage()` function with examples |
| Monolithic code | One long script | Modular functions |
| Wrong exit codes | Implicit exit 0 | Explicit `exit 1` on errors |

## Advanced Topics

If you complete the main lab early, explore:

### 1. ShellCheck Integration

```bash
# Install shellcheck
sudo apt-get install shellcheck  # or brew install shellcheck

# Run on your scripts
shellcheck scripts/my-deploy.sh
```

Compare bashrs and shellcheck output. What does each tool catch?

### 2. Automated Testing with BATS

```bash
# Install BATS (Bash Automated Testing System)
git clone https://github.com/bats-core/bats-core.git
cd bats-core
./install.sh /usr/local

# Create a BATS test
cat > scripts/test-deploy.bats << 'EOF'
#!/usr/bin/env bats

@test "script shows usage without args" {
    run ./scripts/my-deploy.sh
    [ "$status" -eq 1 ]
    [[ "$output" =~ "Usage:" ]]
}

@test "script validates directory exists" {
    run ./scripts/my-deploy.sh /nonexistent prod
    [ "$status" -eq 1 ]
    [[ "$output" =~ "does not exist" ]]
}
EOF

# Run BATS tests
bats scripts/test-deploy.bats
```

### 3. CI/CD Integration

Create a GitHub Actions workflow that runs bashrs and shellcheck on all shell scripts:

```yaml
name: Shell Script Quality

on: [push, pull_request]

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Install bashrs
        run: cargo install bashrs
      - name: Install shellcheck
        run: sudo apt-get install shellcheck
      - name: Run bashrs
        run: find . -name "*.sh" -exec bashrs lint {} \;
      - name: Run shellcheck
        run: find . -name "*.sh" -exec shellcheck {} \;
```

### 4. Documentation Generation

Use Copilot to generate comprehensive documentation:
- Function-level documentation
- Parameter descriptions
- Return values and exit codes
- Usage examples for each function
- Troubleshooting guide

### 5. Performance Optimization

Profile your scripts and optimize:
- Replace `cat file | grep pattern` with `grep pattern file`
- Use `[[ ]]` instead of `[ ]` for better performance
- Minimize subshells and external commands
- Use bash built-ins where possible

## Integration with Course Themes

This lab reinforces key course concepts:

1. **System-Level Development**:
   - Shell scripts are infrastructure code
   - Quality matters for reliability
   - Production scripts need robust error handling

2. **AI-Assisted Development**:
   - GitHub Copilot for systematic improvement
   - Iterative prompting for quality
   - Tool-guided refactoring

3. **Quality Tooling**:
   - bashrs for automated quality checks
   - ShellCheck for additional validation
   - Automated testing for confidence

4. **TDD Mindset**:
   - Write tests for shell functions
   - Verify behavior before and after refactoring
   - Test-driven shell script development

## Resources

- [bashrs documentation](https://github.com/paiml/bashrs)
- [ShellCheck](https://www.shellcheck.net/)
- [Google Shell Style Guide](https://google.github.io/styleguide/shellguide.html)
- [Bash Best Practices](https://bertvv.github.io/cheat-sheets/Bash.html)
- [BATS Testing Framework](https://github.com/bats-core/bats-core)

## Next Steps

After completing this lab:
1. Apply these techniques to your own shell scripts
2. Create a team style guide for shell scripts
3. Set up pre-commit hooks to run bashrs automatically
4. Explore the module 2 labs on workspace strategies and code cleanup
5. Consider creating custom bashrs rules for your organization

## Troubleshooting

**bashrs installation fails:**
```bash
# Ensure Rust is installed
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
cargo install bashrs
```

**GitHub Copilot not providing good suggestions:**
- Ensure related files are open for context
- Be more specific in your prompts
- Include examples in your prompt
- Review the prompts.md file for proven patterns

**Scripts fail after adding set -euo pipefail:**
- This is expected - you're now catching errors that were previously silent
- Fix the underlying issues rather than removing the error handling
- Use `|| true` sparingly for commands that can legitimately fail

**Tests are hard to write:**
- Start with simple syntax and existence checks
- Use temporary directories for file operations
- Mock external dependencies (databases, APIs)
- Focus on error conditions first - they're most important
