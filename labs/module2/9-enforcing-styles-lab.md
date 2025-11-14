# Lab 9: Enforcing Styles and Constraints

## Overview

In this lab, you will learn how to use GitHub Copilot to establish and enforce coding standards, style guidelines, and architectural constraints across your codebase. This helps maintain consistency and quality as the project grows.

## Setup

You can use either:
- The redactr repository for focused practice
- A larger codebase for real-world application

Ensure you have:
- GitHub Copilot enabled
- Linting tools for your language (rustfmt, clippy for Rust; black, pylint for Python)
- Git for version control
- CI/CD access (optional but recommended)

## Understanding Style Enforcement

Style enforcement includes:
- **Code Formatting**: Indentation, line length, spacing
- **Naming Conventions**: Variables, functions, modules
- **Documentation Requirements**: Comments, docstrings
- **Architectural Constraints**: Allowed dependencies, patterns
- **Security Guidelines**: Input validation, error handling

## Tasks

### Task 1: Assess Current State

1. Run existing linters on your codebase:
   ```bash
   # For Rust
   cargo fmt --check
   cargo clippy

   # For Python
   black --check .
   pylint **/*.py
   ```
2. Document current violations and warnings
3. Ask Copilot about style inconsistencies:
   ```
   "@workspace What formatting inconsistencies exist in this project?"
   ```

### Task 2: Configure Formatting Tools

1. Set up or update formatter configuration:
   - For Rust: `rustfmt.toml`
   - For Python: `pyproject.toml` or `.black.toml`
   - For JavaScript: `.prettierrc`

2. Use Copilot to help create configuration:
   ```
   "Create a rustfmt.toml with the following rules: max line length 100, hard tabs"
   ```

3. Run auto-formatting:
   ```bash
   cargo fmt  # Rust
   black .    # Python
   ```

4. Commit the formatting changes

### Task 3: Set Up Linting Rules

1. Configure linter with strict rules:
   ```
   "Create a clippy configuration that enforces strict error handling and documentation"
   ```

2. Address high-priority linting issues:
   - Security warnings (highest priority)
   - Correctness issues
   - Style violations

3. Use Copilot to fix linter warnings:
   - Copy a warning message
   - Ask: "How do I fix this clippy warning: [warning text]?"

### Task 4: Create Custom Guidelines

1. Document project-specific guidelines using Copilot:
   ```
   "Create a coding guidelines document for Rust that includes:
   - Error handling patterns
   - Testing requirements
   - Documentation standards
   - Module organization"
   ```

2. Save as `CONTRIBUTING.md` or `CODING_STYLE.md`

3. Add examples of good and bad patterns

### Task 5: Enforce Documentation Standards

1. Ensure all public functions have documentation:
   ```
   "@workspace Find public functions without documentation"
   ```

2. Use Copilot to generate documentation:
   - Place cursor above a function
   - Type `///` (Rust) or `"""` (Python)
   - Accept Copilot's documentation suggestion
   - Review and refine

3. Set documentation requirements in your linter config

### Task 6: Implement Pre-commit Hooks

1. Install pre-commit framework:
   ```bash
   # For Rust projects
   cargo install cargo-husky

   # For Python projects
   pip install pre-commit
   ```

2. Create `.pre-commit-config.yaml`:
   ```
   "Create a pre-commit configuration that runs rustfmt, clippy, and tests"
   ```

3. Install hooks:
   ```bash
   pre-commit install
   ```

4. Test by making a commit with formatting issues

### Task 7: Set Up CI/CD Checks

1. Create a GitHub Actions workflow:
   ```
   "Create a GitHub Actions workflow that:
   - Runs on pull requests
   - Checks formatting
   - Runs linter
   - Runs tests
   - Fails if any check fails"
   ```

2. Save to `.github/workflows/ci.yml`

3. Test by creating a PR with violations

4. Ensure CI prevents merging until issues are fixed

### Task 8: Create Guidelines for Common Tasks

1. Use Copilot to generate task-specific guidelines:
   ```
   "Generate guidelines for adding a new API endpoint to this project"
   "Generate a checklist for adding a new feature"
   ```

2. Include these in your documentation:
   - How to add new features
   - How to write tests
   - How to handle errors
   - How to document code

3. Reference these in PR templates

## Expected Outcomes

By the end of this lab, you should have:
- Automated formatting configured
- Linting enforced in CI/CD
- Documentation requirements established
- Pre-commit hooks preventing violations
- Written guidelines for contributors

## Enforcement Levels

Choose appropriate enforcement for each rule:

| Level | Description | Example |
|-------|-------------|---------|
| **Auto-fix** | Automatically corrected | Code formatting |
| **Error** | Blocks commit/PR | Security issues, test failures |
| **Warning** | Alerts but allows | Minor style preferences |
| **Info** | Suggestions only | Performance optimizations |

## Deliverables

1. **Configuration Files**:
   - Formatter config (rustfmt.toml, .prettierrc, etc.)
   - Linter config (clippy.toml, .pylintrc, etc.)
   - Pre-commit hooks config

2. **CI/CD Pipeline**:
   - GitHub Actions workflow
   - All checks passing

3. **Documentation**:
   - CONTRIBUTING.md with style guidelines
   - PR template with checklist
   - Examples of good patterns

4. **Clean Codebase**:
   - All auto-fixable issues resolved
   - All critical linter warnings addressed
   - Documentation on public APIs

## Best Practices

1. **Start Strict, Relax Later**: Easier to relax rules than tighten them
2. **Automate Everything**: Don't rely on manual enforcement
3. **Fail Fast**: Catch issues in pre-commit, not in CI
4. **Document Exceptions**: When you break rules, explain why
5. **Continuous Improvement**: Review and update guidelines regularly

## Reflection Questions

1. How many violations did you find initially?
2. Which rules provide the most value?
3. Are there rules that are too strict?
4. How do you balance strictness with productivity?
5. What cultural changes are needed for adoption?

## Advanced Exercise

If time permits:

1. **Custom Linter Rules**: Write a custom lint rule for project-specific constraints
2. **Metrics Dashboard**: Track code quality metrics over time
3. **Automated Refactoring**: Use Copilot to create scripts that auto-fix common issues
4. **Architecture Tests**: Write tests that enforce architectural boundaries

Example architecture test:
```rust
#[test]
fn test_api_doesnt_import_database_directly() {
    // Ensure API layer doesn't directly import database
    // Forces use of repository pattern
}
```

## Rollout Strategy

When implementing in a real project:

1. **Phase 1**: Add configuration, make warnings
2. **Phase 2**: Auto-fix existing code
3. **Phase 3**: Make warnings into errors for new code
4. **Phase 4**: Require compliance for all code
5. **Phase 5**: Continuously refine rules

## Next Steps

Congratulations! You've completed Module 2 on working with large codebases. In Module 3, you'll learn how to use GitHub Copilot to generate infrastructure as code configurations for deployment automation.
