# PMAT Integration Guide

This guide explains how to use PMAT (PAIML MCP Agent Toolkit) for documentation validation and repository health scoring in your projects.

## Overview

**PMAT** is a professional-grade toolkit for:

- **Documentation validation** - Verify all markdown links are valid
- **Repository health scoring** - Measure project quality (0-110 scale)
- **Quality gates** - Enforce standards in CI/CD pipelines
- **Code analysis** - AST-based metrics and pattern detection

- **Repository**: https://github.com/paiml/paiml-mcp-agent-toolkit
- **Installation**: `cargo install paiml-mcp-agent-toolkit`
- **Documentation**: See repo README for comprehensive usage

## Installation

### Using Cargo

```bash
# Install from crates.io
cargo install paiml-mcp-agent-toolkit

# Verify installation
pmat --version
```

### Prerequisites

- Rust toolchain (1.70+)
- Git (for repository analysis)

## Core Commands

### Documentation Validation

Validate all markdown links in your repository:

```bash
# Validate all documentation
pmat validate-docs

# Fail on broken links (for CI)
pmat validate-docs --fail-on-error

# Validate specific directory
pmat validate-docs --root ./docs

# Output JSON for parsing
pmat validate-docs --output json
```

**What it checks**:
- ✅ Internal links (relative paths)
- ✅ External links (HTTP/HTTPS)
- ✅ Anchor links (#headings)
- ✅ File existence
- ✅ Image references

**Example output**:

```
📊 Documentation Link Validation Summary
========================================

📁 Files scanned:    15
🔗 Links found:      28
✅ Valid links:      28
❌ Broken links:     0
⏭️  Skipped links:    0
⏱️  Duration:         1157ms

🎉 All documentation links are valid!
```

### Repository Health Scoring

Calculate comprehensive quality score:

```bash
# Get repository health score
pmat repo-score

# Verbose output with details
pmat repo-score --verbose
```

**Scoring categories** (110 points total):

1. **Documentation** (15 points)
   - README completeness
   - CONTRIBUTING guide
   - LICENSE file
   - Code documentation

2. **Pre-commit Hooks** (20 points)
   - `.pre-commit-config.yaml` exists
   - Hooks configured
   - Common hooks present

3. **Repository Hygiene** (15 points)
   - `.gitignore` configured
   - No sensitive files
   - Clean history

4. **Build/Test Automation** (25 points)
   - Makefile with standard targets
   - Test infrastructure
   - Quality gates

5. **Continuous Integration** (20 points)
   - CI workflow exists
   - Runs tests
   - Enforces quality

6. **PMAT Compliance** (5 points)
   - `.pmat-gates.toml` configuration
   - Quality thresholds defined

7. **Additional Quality** (10 bonus points)
   - Code coverage
   - Security scanning
   - Performance testing

**Example output**:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📊  Repository Health Score
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📌  Summary
  Score: 92.5/110
  Grade: A

📂  Categories
  ✅ Documentation             13.5/15.0 (90.0%)
  ✅ Pre-commit Hooks          18.0/20.0 (90.0%)
  ✅ Repository Hygiene        15.0/15.0 (100.0%)
  ✅ Build/Test Automation     23.0/25.0 (92.0%)
  ✅ Continuous Integration    19.0/20.0 (95.0%)
  ✅ PMAT Compliance           4.0/5.0 (80.0%)

💡  Recommendations
  🟡 Add coverage reporting to increase documentation score
  🟡 Configure additional pre-commit hooks (trailing-whitespace, etc.)
```

## Integration with This Course Repository

### Makefile Integration

This repository uses PMAT in the Makefile:

```makefile
validate-docs: ## Validate documentation links with PMAT
	@echo "🔗 Validating documentation links with PMAT..."
	@if command -v pmat >/dev/null 2>&1; then \
		pmat validate-docs --fail-on-error && \
		echo "✅ All documentation links are valid!"; \
	else \
		echo "⚠️  PMAT not found - skipping link validation"; \
	fi

repo-score: ## Calculate repository health score with PMAT
	@echo "📊 Calculating repository health score..."
	@if command -v pmat >/dev/null 2>&1; then \
		pmat repo-score; \
	else \
		echo "⚠️  PMAT not found - skipping repository scoring"; \
	fi
```

### CI/CD Integration

GitHub Actions workflow (`.github/workflows/ci.yml`):

```yaml
- name: Install PMAT
  run: cargo install paiml-mcp-agent-toolkit

- name: Validate documentation links
  run: make validate-docs

- name: Check repository score
  run: pmat repo-score
```

## Advanced Usage

### Quality Gates Configuration

Create `.pmat-gates.toml` for custom thresholds:

```toml
[quality-gates]
min_repo_score = 90
fail_on_broken_links = true
require_readme = true
require_license = true
require_ci = true

[documentation]
require_contributing = false
require_changelog = false
min_coverage_docs = 70

[testing]
min_test_coverage = 80
require_unit_tests = true
require_integration_tests = true
```

### Code Analysis

```bash
# Analyze code complexity
pmat analyze complexity --project-path .

# Find technical debt
pmat analyze satd --path .

# Find dead code
pmat analyze dead-code --path .

# Generate project context (AST)
pmat context
```

### Quality Gate Enforcement

```bash
# Run all quality gates
pmat quality-gate --strict

# Enforce specific thresholds
pmat quality-gate --min-score 85 --fail-on-broken-links
```

## Best Practices

### 1. Run Locally Before Committing

```bash
# Quick validation
make validate-docs

# Full quality check
make validate
```

### 2. Fix Broken Links Immediately

When PMAT finds broken links:

```
❌ Broken link in README.md:45
   Link: ./docs/missing-file.md
   Reason: File not found
```

Fix by:
- Creating the missing file
- Updating the link path
- Removing the link if obsolete

### 3. Monitor Repository Score

Target: **90+/110 for production repositories**

- 85-89: Good, room for improvement
- 90-99: Excellent
- 100-110: Outstanding

### 4. Automate in CI/CD

Always run PMAT in CI to:
- Prevent broken links from merging
- Maintain quality standards
- Track score trends over time

## Common Issues

### Issue: PMAT not found

```bash
# Install PMAT
cargo install paiml-mcp-agent-toolkit

# Verify
which pmat
```

### Issue: False positives on external links

Some external links may fail due to:
- Rate limiting
- Temporary outages
- Firewall rules

Configure retries or exclude domains:

```bash
pmat validate-docs --max-retries 3 --exclude "example.com"
```

### Issue: Slow validation

For large repositories:

```bash
# Increase concurrency
pmat validate-docs --max-concurrent 20

# Reduce timeout
pmat validate-docs --timeout 10
```

## Integration with Other Tools

### With bashrs

```makefile
lint: lint-makefile lint-markdown
	pmat validate-docs

lint-makefile:
	bashrs lint Makefile

lint-markdown:
	markdownlint-cli2 "**/*.md"
```

### With pre-commit

Add to `.pre-commit-config.yaml`:

```yaml
- repo: local
  hooks:
    - id: pmat-validate-docs
      name: Validate documentation with PMAT
      entry: pmat validate-docs --fail-on-error
      language: system
      pass_filenames: false
```

### With GitHub Actions

```yaml
- name: Quality Gates
  run: |
    pmat validate-docs --fail-on-error
    score=$(pmat repo-score --output json | jq '.score')
    if (( $(echo "$score < 90" | bc -l) )); then
      echo "Score $score below threshold"
      exit 1
    fi
```

## Resources

- [PMAT Repository](https://github.com/paiml/paiml-mcp-agent-toolkit)
- [PMAT Documentation](https://github.com/paiml/paiml-mcp-agent-toolkit#readme)
- [Quality-Driven Development](https://paiml.com) - QDD methodology

## Next Steps

1. **Install PMAT** - `cargo install paiml-mcp-agent-toolkit`
2. **Run initial validation** - `pmat validate-docs && pmat repo-score`
3. **Fix issues** - Address broken links and quality gaps
4. **Integrate in CI** - Add to `.github/workflows/ci.yml`
5. **Set quality goals** - Target 90+ repo score
6. **Monitor trends** - Track score over time
