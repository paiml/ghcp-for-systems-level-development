# bashrs Integration Guide

This guide explains how to use bashrs for Makefile and shell script linting/formatting in your projects.

## Overview

**bashrs** is a professional-grade linting and formatting tool for:

- **Makefile linting** - Enforce best practices and catch errors
- **Shell script validation** - Improve bash script quality
- **Formatting** - Consistent style across projects
- **Quality gates** - Prevent bad scripts from being committed

- **Repository**: https://github.com/paiml/bashrs
- **Installation**: `cargo install bashrs`
- **Language**: Rust (fast and reliable)

## Installation

### Using Cargo

```bash
# Install from crates.io
cargo install bashrs

# Verify installation
bashrs --version
```

### Prerequisites

- Rust toolchain (1.70+)

## Core Commands

### Lint Makefiles

Check Makefiles for quality issues:

```bash
# Lint a Makefile
bashrs lint Makefile

# Lint with strict mode
bashrs lint --strict Makefile

# Check multiple files
bashrs lint Makefile */Makefile
```

**What it checks**:
- ✅ Proper variable quoting
- ✅ Consistent indentation (tabs for recipes)
- ✅ `.PHONY` declarations
- ✅ Undefined variables
- ✅ Shell command best practices
- ✅ Target dependencies

**Example output**:

```
Linting: Makefile

Summary:
  0 errors
  3 warnings
  File: Makefile

Warnings:
  Line 15: Consider using .PHONY for target 'clean'
  Line 23: Variable 'FOO' is defined but never used
  Line 45: Use $$(VAR) instead of ${VAR} in recipes

✅ No errors found (warnings are acceptable)
```

### Lint Shell Scripts

Check bash scripts for quality issues:

```bash
# Lint a shell script
bashrs lint script.sh

# Lint all scripts in directory
bashrs lint scripts/*.sh

# Show only errors (no warnings)
bashrs lint --errors-only deploy.sh
```

**What it checks**:
- ✅ Variable quoting ("$var" not $var)
- ✅ Error handling (set -euo pipefail)
- ✅ Function naming conventions
- ✅ Command existence before use
- ✅ Proper exit codes
- ✅ ShellCheck integration

### Format Makefiles

Auto-format Makefiles:

```bash
# Format in place
bashrs format Makefile

# Preview changes without modifying
bashrs format --dry-run Makefile

# Format multiple files
bashrs format Makefile */Makefile
```

**Formatting rules**:
- Tabs for recipe indentation
- Spaces for variable alignment
- Consistent variable syntax
- Sorted `.PHONY` declarations

## Integration with This Course Repository

### Makefile Integration

This repository uses bashrs in the Makefile:

```makefile
lint-makefile: ## Lint the Makefile with bashrs
	@echo "🔍 Linting Makefile with bashrs..."
	@if command -v bashrs >/dev/null 2>&1; then \
		if bashrs lint Makefile 2>&1 | grep -E "^Summary:.*[1-9][0-9]* error" > /dev/null; then \
			echo "❌ Makefile has errors!"; \
			exit 1; \
		else \
			echo "✅ Makefile passed linting (warnings are acceptable)!"; \
		fi \
	else \
		echo "⚠️  bashrs not found - skipping Makefile linting"; \
	fi

lint: lint-makefile lint-markdown
	@echo "✅ All linting passed!"
```

### CI/CD Integration

GitHub Actions workflow (`.github/workflows/ci.yml`):

```yaml
- name: Install bashrs
  run: cargo install bashrs

- name: Lint Makefile
  run: make lint-makefile

- name: Lint shell scripts
  run: bashrs lint examples/bashrs-cleanup/scripts/*.sh
```

### Pre-commit Integration

Add to `.pre-commit-config.yaml`:

```yaml
- repo: local
  hooks:
    - id: bashrs-lint
      name: Lint Makefiles and shell scripts with bashrs
      entry: bashrs lint
      language: system
      files: \.(sh|Makefile)$
```

## Common Quality Issues bashrs Catches

### 1. Unquoted Variables

❌ **Bad**:
```bash
rm -rf $DIR/*
```

✅ **Good**:
```bash
rm -rf "${DIR:?}/"*
```

**Why**: Unquoted variables break with spaces or special characters.

### 2. Missing Error Handling

❌ **Bad**:
```bash
#!/bin/bash
cd /some/dir
./script.sh
```

✅ **Good**:
```bash
#!/bin/bash
set -euo pipefail

cd /some/dir || exit 1
./script.sh
```

**Why**: Scripts should fail fast on errors.

### 3. Inconsistent Indentation in Makefiles

❌ **Bad**:
```makefile
target:
    echo "spaces"  # Uses spaces
	echo "tabs"     # Uses tabs
```

✅ **Good**:
```makefile
target:
	echo "tabs"     # Consistent tabs
	echo "tabs"
```

**Why**: Make requires tabs for recipe lines.

### 4. Missing .PHONY Declarations

❌ **Bad**:
```makefile
clean:
	rm -rf build/
```

✅ **Good**:
```makefile
.PHONY: clean

clean:
	rm -rf build/
```

**Why**: Prevents conflicts with files named "clean".

### 5. Poor Variable Naming

❌ **Bad**:
```bash
d=/tmp/foo
f=file.txt
```

✅ **Good**:
```bash
readonly TEMP_DIR="/tmp/foo"
readonly CONFIG_FILE="file.txt"
```

**Why**: Descriptive names improve maintainability.

## Best Practices

### 1. Run bashrs Before Committing

```bash
# Quick check
bashrs lint Makefile

# Check all scripts
find . -name "*.sh" -exec bashrs lint {} \;
```

### 2. Fix Errors, Consider Warnings

bashrs distinguishes between:
- **Errors**: Must fix (will fail CI)
- **Warnings**: Should fix (won't fail CI)

Example approach:
```bash
# Fail on errors
if bashrs lint Makefile | grep "error"; then
    exit 1
fi
```

### 3. Use bashrs format for Consistency

```bash
# Format all Makefiles in project
find . -name "Makefile" -exec bashrs format {} \;
```

### 4. Integrate in Development Workflow

```bash
# Add to git pre-commit hook
#!/bin/bash
if git diff --cached --name-only | grep -E '\.(sh|Makefile)$'; then
    bashrs lint $(git diff --cached --name-only | grep -E '\.(sh|Makefile)$')
fi
```

## Advanced Usage

### Custom Rules

Create `.bashrs.toml` for project-specific rules:

```toml
[lint]
max_line_length = 120
require_error_handling = true
require_phony_targets = true
tab_width = 4

[format]
align_variables = true
sort_phony = true
```

### Selective Linting

```bash
# Lint only specific issues
bashrs lint --check=quoting,error-handling script.sh

# Ignore specific warnings
bashrs lint --ignore=W001,W002 Makefile
```

### Integration with GitHub Copilot

Use GitHub Copilot to fix bashrs warnings:

**Prompt**:
```
Fix the bashrs linting warnings in this Makefile:
- Line 15: Missing .PHONY declaration
- Line 23: Unused variable FOO
- Line 45: Use $$(VAR) instead of ${VAR}
```

**Copilot will suggest**:
```makefile
.PHONY: clean install test

# Remove unused FOO variable
# Change ${VAR} to $$(VAR) in recipes
```

## Example: Cleaning Up a Messy Script

See `examples/bashrs-cleanup/` for a complete example.

### Before (Messy):

```bash
#!/bin/bash
d=$1
if [ -z $d ]; then
echo "need dir"
exit 1
fi
cd $d
npm install
```

bashrs output:
```
Errors:
  Line 3: Unquoted variable $d
  Line 4: Missing error handling
  Line 8: Unquoted variable $d

Warnings:
  Line 2: Consider using 'set -euo pipefail'
  Line 3: Use descriptive variable names
```

### After (Clean):

```bash
#!/bin/bash
set -euo pipefail

readonly PROJECT_DIR="${1:?Project directory required}"

validate_directory() {
    if [[ ! -d "${PROJECT_DIR}" ]]; then
        echo "Error: Directory does not exist" >&2
        exit 1
    fi
}

install_dependencies() {
    cd "${PROJECT_DIR}" || exit 1
    npm install
}

main() {
    validate_directory
    install_dependencies
}

main "$@"
```

bashrs output:
```
Summary:
  0 errors
  0 warnings
  ✅ Perfect!
```

## Bonus Exercise Integration

The bonus lab (`labs/bonus/bonus1-bashrs-cleanup.md`) uses bashrs to:

1. Identify quality issues in messy scripts
2. Provide specific error/warning messages
3. Validate improvements after using GitHub Copilot
4. Measure quality improvement metrics

**Workflow**:
```bash
# 1. Analyze messy script
bashrs lint scripts/messy-deploy.sh
# Output: 7 errors, 5 warnings

# 2. Use GitHub Copilot to fix issues

# 3. Validate improvements
bashrs lint scripts/clean-deploy.sh
# Output: 0 errors, 0 warnings

# 4. Format for consistency
bashrs format scripts/clean-deploy.sh
```

## Comparison with Other Tools

| Feature | bashrs | shellcheck | shfmt |
|---------|--------|----------|-------|
| Makefile linting | ✅ | ❌ | ❌ |
| Shell script linting | ✅ | ✅ | ❌ |
| Formatting | ✅ | ❌ | ✅ |
| Speed | Fast (Rust) | Medium | Fast (Go) |
| Integration | Makefile + Shell | Shell only | Shell only |

**bashrs advantages**:
- Unified tool for Makefiles and shell scripts
- Written in Rust (fast, reliable)
- Makefile-specific rules
- Format + lint in one tool

## Troubleshooting

### Issue: bashrs not found

```bash
# Install
cargo install bashrs

# Add to PATH if needed
export PATH="$HOME/.cargo/bin:$PATH"
```

### Issue: Too many warnings

```bash
# Show only errors
bashrs lint --errors-only script.sh

# Or ignore specific warnings
bashrs lint --ignore=W001,W002 script.sh
```

### Issue: Format changes break Makefile

```bash
# Always preview first
bashrs format --dry-run Makefile

# Then apply
bashrs format Makefile
```

## Resources

- [bashrs Repository](https://github.com/paiml/bashrs)
- [Makefile Best Practices](https://makefiletutorial.com/)
- [Bash Best Practices](https://mywiki.wooledge.org/BashGuide/Practices)
- [ShellCheck](https://www.shellcheck.net/) - Complementary tool

## Next Steps

1. **Install bashrs** - `cargo install bashrs`
2. **Lint existing files** - `bashrs lint Makefile scripts/*.sh`
3. **Fix errors** - Address critical issues
4. **Consider warnings** - Improve code quality
5. **Format consistently** - `bashrs format Makefile`
6. **Integrate in CI** - Add to `.github/workflows/ci.yml`
7. **Add pre-commit hook** - Enforce quality before commits

## Course Integration

bashrs is used throughout this course for:

- **Module 1**: Test script quality
- **Module 2**: Refactor deployment scripts
- **Module 3**: Validate IaC helper scripts
- **Bonus Lab**: Complete shell script cleanup exercise

By mastering bashrs, you'll ensure your shell scripts and Makefiles follow professional standards and best practices.
