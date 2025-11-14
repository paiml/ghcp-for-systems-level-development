# Course Repository Layout Specification

**Version**: 1.0
**Course**: GitHub Copilot for System-Level Development
**Series**: GitHub Copilot Mastery Pathway - Course 2 of 4
**Partner**: LinkedIn Learning
**Last Updated**: 2025-11-14

## Executive Summary

This specification defines the standardized repository structure for "GitHub Copilot for System-Level Development" (Course 2 in the GitHub Copilot Mastery Pathway created in partnership with LinkedIn Learning). It ensures consistency with the other courses in the series while accommodating the unique needs of system-level development content, including working examples, quality tooling, and infrastructure automation.

## 1. Course Context

### 1.1 Series Position

This repository is **Course 2** in a 4-course learning pathway:

1. **Advanced Prompting with GitHub Copilot** - Foundation prompting and conversational techniques
2. **GitHub Copilot for System-Level Development** (this course) - TDD, large codebases, IaC
3. **Responsible AI Development with GitHub Copilot** - Code validation, security, customization
4. **Capstone: Building Production Features with Copilot** - Full-stack production implementation

### 1.2 Course Overview

- **Title**: GitHub Copilot for System-Level Development
- **Duration**: ~60 minutes
- **Format**: 3-5 minute videos organized into 3 modules
- **Target Audience**: Developers with GitHub Copilot experience seeking system-level skills
- **Learning Focus**: TDD workflows, large-scale refactoring, infrastructure automation

### 1.3 Module Structure

#### Module 1: AI-Augmented Test-Driven Development
- 2.1.1 Introduction to AI-assisted TDD
- 2.1.2 Generating complex test suites
- 2.1.3 Mocking dependencies with Copilot
- 2.1.4 Challenge: TDD for a new feature
- 2.1.5 Solution: TDD for a new feature
- 2.1.6 Evaluating test coverage

#### Module 2: Large-Scale Refactoring
- 2.2.1 Strategic use of workspace
- 2.2.2 Analyzing cross-file dependencies
- 2.2.3 Challenge: System-wide code cleanup
- 2.2.4 Solution: System-wide code cleanup
- 2.2.5 Enforcing styles and constraints
- 2.2.6 Generating guidelines for specific tasks

#### Module 3: Infrastructure as Code with Copilot
- 2.3.1 Generating IaC configurations
- 2.3.2 Creating Dockerfiles with AI
- 2.3.3 Terraform configuration generation
- 2.3.4 Course wrap-up

## 2. Repository Structure

### 2.1 Top-Level Directory Layout

```
ghcp-for-systems-level-development/
├── README.md                        # Course overview and navigation
├── CLAUDE.md                        # AI assistant guidance document
├── LICENSE                          # MIT license
├── Makefile                         # Quality gates, testing, validation
├── .gitignore                       # Git ignore patterns
├── .github/                         # GitHub-specific files
│   ├── workflows/                   # CI/CD workflows
│   │   └── ci.yml                   # Quality gates automation
│   └── header.svg                   # Course banner image
├── docs/                            # Documentation and specifications
│   ├── specifications/              # Technical specifications
│   │   └── course-repo-layout.md    # This document
│   └── quality/                     # Quality metrics and reports
│       └── repo-score.md            # PMAT repository health score
├── labs/                            # Hands-on lab exercises
│   ├── module1/                     # TDD labs
│   │   ├── 1-introduction-to-tdd-lab.md
│   │   ├── 2-complex-test-suites-lab.md
│   │   ├── 3-mocking-dependencies-lab.md
│   │   ├── 4-tdd-challenge-lab.md
│   │   └── 5-test-coverage-lab.md
│   ├── module2/                     # Large-scale refactoring labs
│   │   ├── 6-workspace-strategies-lab.md
│   │   ├── 7-cross-file-dependencies-lab.md
│   │   ├── 8-system-cleanup-lab.md
│   │   └── 9-enforcing-styles-lab.md
│   ├── module3/                     # Infrastructure labs
│   │   ├── 10-iac-configurations-lab.md
│   │   ├── 11-dockerfiles-lab.md
│   │   └── 12-terraform-lab.md
│   └── bonus/                       # Advanced bonus exercises
│       └── bonus1-bashrs-cleanup.md # Shell script quality with bashrs
├── examples/                        # Working code examples
│   └── bashrs-cleanup/              # Bonus exercise working example
│       ├── README.md                # Example overview
│       ├── scripts/                 # Shell scripts to clean up
│       │   ├── messy-deploy.sh      # Before cleanup
│       │   └── clean-deploy.sh      # After cleanup
│       └── tests/                   # Test scripts
│           └── test-scripts.sh      # Validation tests
└── resources/                       # Additional learning resources
    ├── redactr-reference.md         # Guide to the redactr practice repo
    ├── pmat-integration.md          # Using PMAT for quality validation
    └── bashrs-integration.md        # Using bashrs for shell script quality
```

### 2.2 Critical Files

#### README.md Requirements
- Course banner/header image from `.github/header.svg`
- Course series context (Course 2 of 4 with links to other courses)
- Partnership acknowledgment (LinkedIn Learning)
- Duration and format information (~60 minutes, 3-5 min videos)
- Clear learning objectives aligned with course content
- Module-organized lab index with descriptions
- Practice repository references (redactr, etc.)
- Setup instructions and prerequisites
- Quality tools documentation (PMAT, bashrs)
- Navigation links (Labs, Resources, Modules)

#### CLAUDE.md Requirements
- Project type identification (educational course repository)
- Course series context and position (Course 2 of 4)
- Partnership information (LinkedIn Learning)
- Repository structure documentation
- Module and video structure listing
- Lab structure patterns and conventions
- Practice repository references
- Quality tooling integration (PMAT, bashrs)
- Working example documentation
- Content editing guidelines

#### Makefile Requirements
- `help` - Display available targets with descriptions
- `install` - Install dependencies (PMAT, bashrs, language runtimes)
- `lint` - Lint Makefiles with bashrs, markdown with markdownlint
- `test` - Run all tests including examples
- `test-fast` - Quick validation (lint only)
- `validate` - Full validation suite (structure, links, examples)
- `validate-docs` - Use `pmat validate-docs` for link checking
- `repo-score` - Use `pmat repo-score` for health metrics
- `example-build` - Build working examples
- `example-test` - Test working examples
- `clean` - Clean up build artifacts
- Color-coded output (blue, green, yellow, red)
- Proper `.PHONY` declarations
- Error handling and dependency checking

### 2.3 Lab File Structure

Each lab follows this standardized format:

```markdown
# Lab [N]: [Lab Title]

## Overview
[Brief description of what students will learn]

## Prerequisites
- List of required knowledge/skills
- Required software/tools
- Previous lab completion requirements

## Setup
1. Clone/setup instructions
2. Environment configuration
3. Tool installation verification

## Tasks
### Task 1: [Task Name]
[Detailed instructions with code examples]

### Task 2: [Task Name]
[Progressive difficulty building on Task 1]

[Continue for 4-10 tasks depending on complexity]

## Expected Outcomes
By the end of this lab, you should be able to:
- [Concrete skill 1]
- [Concrete skill 2]
- [Concrete skill 3]

## Reflection Questions
1. [Question prompting deeper learning]
2. [Question connecting to real-world scenarios]
3. [Question about tool effectiveness]

## Success Criteria
- [ ] All tasks completed successfully
- [ ] Tests pass (if applicable)
- [ ] Reflection questions answered
- [ ] Understanding of key concepts demonstrated

## Next Steps
Brief preview of next lab or how to apply these skills
```

### 2.4 Working Example Structure

The bashrs cleanup example follows this structure:

```
examples/bashrs-cleanup/
├── README.md                    # Example overview and learning objectives
├── scripts/
│   ├── messy-deploy.sh          # Original script with quality issues
│   ├── clean-deploy.sh          # Cleaned version showing best practices
│   └── prompts.md               # GitHub Copilot prompts used
└── tests/
    └── test-scripts.sh          # Validation that both scripts work
```

## 3. Quality Standards

### 3.1 PMAT Integration

All documentation must pass PMAT validation:

```bash
# Validate all documentation links
make validate-docs  # Uses: pmat validate-docs

# Calculate repository health score (target: 90+/110)
make repo-score     # Uses: pmat repo-score
```

**Required PMAT Checks**:
- `pmat validate-docs` - All markdown links must be valid
- `pmat repo-score` - Repository health score ≥ 90/110
- Documentation must be free of hallucinations (broken references, invalid commands)

### 3.2 bashrs Integration

All Makefiles and shell scripts must pass bashrs quality checks:

```bash
# Lint Makefile
bashrs lint Makefile

# Format Makefile
bashrs format Makefile

# Lint shell scripts in examples
bashrs lint examples/bashrs-cleanup/scripts/*.sh
```

**Required bashrs Checks**:
- No errors in Makefiles (warnings acceptable)
- Proper variable quoting in shell scripts
- Consistent indentation (tabs for recipes, spaces for continuation)
- No unused variables or targets

### 3.3 Markdown Quality

All markdown files must pass markdownlint:

```bash
markdownlint-cli2 "**/*.md" "#node_modules"
```

**Required Standards**:
- Proper heading hierarchy (no skipped levels)
- Fenced code blocks with language specifiers
- No trailing whitespace
- Consistent list formatting
- Valid internal links

### 3.4 CI/CD Integration

GitHub Actions workflow (`.github/workflows/ci.yml`):

```yaml
name: CI

on:
  push:
    branches: [main, master]
  pull_request:
    branches: [main, master]

jobs:
  quality-gates:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Install PMAT
        run: |
          # PMAT installation steps

      - name: Install bashrs
        run: |
          # bashrs installation steps

      - name: Run quality gates
        run: make validate

      - name: Check repository score
        run: make repo-score
```

## 4. Content Alignment

### 4.1 Consistency Across Series

**Structural Consistency**:
- All courses use `labs/moduleN/` structure
- All courses have `README.md`, `CLAUDE.md`, `LICENSE`
- All courses reference partnership and series context
- All courses use ~60 minute duration format

**Quality Consistency**:
- All courses integrate PMAT for documentation validation
- All courses use Makefiles for quality gates
- All courses have CI/CD workflows
- All courses maintain high repository health scores

**Documentation Consistency**:
- Consistent lab format (Prerequisites → Setup → Tasks → Reflection → Success)
- Consistent README structure (About → Objectives → Modules → Labs → Resources)
- Consistent CLAUDE.md structure (Overview → Context → Structure → Guidelines)

### 4.2 Course-Specific Differences

**Course 1 (Advanced Prompting)**:
- Focuses on prompting techniques and patterns
- No executable code (references external repos)
- Examples: Python-to-Rust CLI conversion
- Tools: GitHub Copilot only

**Course 2 (System-Level Development)** - THIS COURSE:
- Focuses on TDD, large codebases, infrastructure
- Includes working shell script examples
- Examples: bashrs cleanup, redactr Rust microservice
- Tools: GitHub Copilot + PMAT + bashrs

**Course 3 (Responsible AI Development)**:
- Focuses on validation and security tools
- Includes complete Deno-based security scanners
- Examples: Multiple TypeScript security tools
- Tools: GitHub Copilot + Deno + PMAT + bashrs

**Course 4 (Capstone)**:
- Focuses on full-stack production implementation
- Includes complete application with API, business logic, data layer
- Examples: TypeScript/Deno production application
- Tools: GitHub Copilot + Deno + PMAT + full test infrastructure

## 5. Migration Plan

### 5.1 Current State Analysis

**Existing Structure**:
```
ghcp-for-systems-level-development/
├── README.md         # Minimal, needs expansion
├── LICENSE           # ✅ Correct
├── .gitignore        # ✅ Correct
└── course/           # ❌ Non-standard directory name
    ├── README.md
    └── labs/         # ✅ Content exists but wrong location
```

**Issues to Address**:
1. Labs are in `course/labs/` instead of `labs/`
2. Missing `CLAUDE.md` with AI assistant guidance
3. Missing `Makefile` with quality gates
4. Missing `.github/workflows/` for CI/CD
5. Missing `docs/specifications/` for documentation
6. Missing working examples
7. README needs expansion with series context
8. Missing module-based organization in labs
9. Missing PMAT and bashrs integration
10. Missing quality validation tooling

### 5.2 Implementation Steps

**Phase 1: Structure Reorganization**
1. Create `docs/specifications/` directory
2. Create this specification document
3. Create `.github/workflows/` directory
4. Move `course/labs/` to `labs/`
5. Remove empty `course/` directory
6. Organize labs into `module1/`, `module2/`, `module3/` subdirectories

**Phase 2: Documentation Creation**
1. Create comprehensive `CLAUDE.md`
2. Expand `README.md` with series context, modules, navigation
3. Create `.github/header.svg` course banner
4. Create `resources/` directory with integration guides
5. Add lab numbering to match video structure

**Phase 3: Quality Tooling Integration**
1. Create `Makefile` with all required targets
2. Create `.github/workflows/ci.yml`
3. Integrate `pmat validate-docs` command
4. Integrate `pmat repo-score` command
5. Integrate `bashrs lint` for Makefile validation
6. Add markdown linting with markdownlint-cli2

**Phase 4: Working Example Creation**
1. Create `examples/bashrs-cleanup/` directory
2. Create messy shell script example
3. Create cleaned shell script example
4. Document prompts used for cleanup
5. Create test validation scripts
6. Create `labs/bonus/bonus1-bashrs-cleanup.md` lab

**Phase 5: Validation and Testing**
1. Run `pmat validate-docs` to check all links
2. Run `pmat repo-score` to measure health (target: 90+)
3. Run `bashrs lint Makefile` to validate Makefile
4. Run `make validate` to test all quality gates
5. Test CI/CD workflow
6. Verify all labs reference correct paths

### 5.3 File Migrations

**Move Operations**:
```bash
# Reorganize labs
mkdir -p labs/module1 labs/module2 labs/module3 labs/bonus
mv course/labs/1-introduction-to-tdd-lab.md labs/module1/
mv course/labs/2-complex-test-suites-lab.md labs/module1/
mv course/labs/3-mocking-dependencies-lab.md labs/module1/
mv course/labs/4-tdd-challenge-lab.md labs/module1/
mv course/labs/5-test-coverage-lab.md labs/module1/
mv course/labs/6-workspace-strategies-lab.md labs/module2/
mv course/labs/7-cross-file-dependencies-lab.md labs/module2/
mv course/labs/8-system-cleanup-lab.md labs/module2/
mv course/labs/9-enforcing-styles-lab.md labs/module2/
mv course/labs/10-iac-configurations-lab.md labs/module3/
mv course/labs/11-dockerfiles-lab.md labs/module3/
mv course/labs/12-terraform-lab.md labs/module3/
rmdir course/labs
rmdir course
```

**Create Operations**:
```bash
# Create new directories
mkdir -p .github/workflows
mkdir -p docs/specifications docs/quality
mkdir -p examples/bashrs-cleanup/scripts examples/bashrs-cleanup/tests
mkdir -p resources
```

## 6. Practice Repository References

### 6.1 Primary Practice Repository

**redactr** - Rust microservice for PII redaction
- **URL**: https://github.com/alfredodeza/redactr
- **Language**: Rust
- **Purpose**: Real-world system-level development practice
- **Usage**: All Module 1 (TDD) and Module 2 (refactoring) labs

### 6.2 Supporting Tools

**PMAT (PAIML MCP Agent Toolkit)**
- **URL**: https://github.com/paiml/paiml-mcp-agent-toolkit
- **Purpose**: Documentation validation, repository health scoring
- **Integration**: `make validate-docs`, `make repo-score`

**bashrs**
- **URL**: https://github.com/paiml/bashrs
- **Purpose**: Makefile and shell script linting/formatting
- **Integration**: `make lint`, bonus exercise example

## 7. Success Metrics

### 7.1 Repository Health

**PMAT Repo Score**: ≥ 90/110
- Documentation completeness: 100%
- Link validity: 100%
- Structure compliance: 100%
- Quality tooling integration: 100%

### 7.2 Quality Gates

**Required Passing Gates**:
- ✅ `make lint` - No errors (warnings acceptable)
- ✅ `make test` - All tests pass
- ✅ `make validate` - Full validation passes
- ✅ `make validate-docs` - All links valid
- ✅ `make repo-score` - Score ≥ 90/110
- ✅ CI/CD pipeline - All jobs pass

### 7.3 Documentation Quality

**Required Standards**:
- All internal links valid (verified by PMAT)
- All code examples have language specifiers
- All labs follow standardized format
- README provides clear navigation
- CLAUDE.md provides comprehensive AI guidance
- No hallucinations (broken references, invalid commands)

## 8. Maintenance Guidelines

### 8.1 Adding New Labs

When adding a new lab:
1. Place in appropriate `labs/moduleN/` directory
2. Follow standardized lab format (section 2.3)
3. Update README.md module section
4. Update CLAUDE.md lab listing
5. Run `make validate-docs` to verify links
6. Run `make test` to ensure no breakage

### 8.2 Updating Course Content

When updating content:
1. Maintain consistency with video structure
2. Keep lab numbering aligned with videos
3. Update CLAUDE.md if structure changes
4. Run full `make validate` suite
5. Check `pmat repo-score` doesn't decrease

### 8.3 Quality Gate Enforcement

All changes must:
1. Pass `make validate` locally before commit
2. Pass CI/CD pipeline checks
3. Maintain or improve repo-score
4. Include updated documentation if structure changes

## 9. Reference Links

### 9.1 Related Repositories

- [Course 1: Advanced Prompting](https://github.com/paiml/advanced-prompting-with-github-copilot)
- [Course 3: Responsible AI Development](https://github.com/paiml/responsible-ai-dev)
- [Course 4: Capstone](https://github.com/paiml/GitHub-Copilot-Mastery-Capstone)

### 9.2 Tool Documentation

- [PMAT Documentation](https://github.com/paiml/paiml-mcp-agent-toolkit)
- [bashrs Documentation](https://github.com/paiml/bashrs)
- [GitHub Copilot Documentation](https://docs.github.com/en/copilot)
- [redactr Repository](https://github.com/alfredodeza/redactr)

## 10. Appendix

### 10.1 Video to Lab Mapping

| Video ID | Video Title | Lab File |
|----------|-------------|----------|
| 2.1.1 | Introduction to AI-assisted TDD | `labs/module1/1-introduction-to-tdd-lab.md` |
| 2.1.2 | Generating complex test suites | `labs/module1/2-complex-test-suites-lab.md` |
| 2.1.3 | Mocking dependencies with Copilot | `labs/module1/3-mocking-dependencies-lab.md` |
| 2.1.4 | Challenge: TDD for a new feature | `labs/module1/4-tdd-challenge-lab.md` |
| 2.1.5 | Solution: TDD for a new feature | (integrated in lab 4) |
| 2.1.6 | Evaluating test coverage | `labs/module1/5-test-coverage-lab.md` |
| 2.2.1 | Strategic use of workspace | `labs/module2/6-workspace-strategies-lab.md` |
| 2.2.2 | Analyzing cross-file dependencies | `labs/module2/7-cross-file-dependencies-lab.md` |
| 2.2.3 | Challenge: System-wide code cleanup | `labs/module2/8-system-cleanup-lab.md` |
| 2.2.4 | Solution: System-wide code cleanup | (integrated in lab 8) |
| 2.2.5 | Enforcing styles and constraints | `labs/module2/9-enforcing-styles-lab.md` |
| 2.2.6 | Generating guidelines for specific tasks | (integrated in lab 9) |
| 2.3.1 | Generating IaC configurations | `labs/module3/10-iac-configurations-lab.md` |
| 2.3.2 | Creating Dockerfiles with AI | `labs/module3/11-dockerfiles-lab.md` |
| 2.3.3 | Terraform configuration generation | `labs/module3/12-terraform-lab.md` |
| 2.3.4 | Course wrap-up | (no associated lab) |

### 10.2 Comparison with Other Courses

| Feature | Course 1 | Course 2 (This) | Course 3 | Course 4 |
|---------|----------|-----------------|----------|----------|
| Executable Code | Minimal | Shell scripts | TypeScript tools | Full application |
| Primary Language | Multi-language | Rust/Shell | TypeScript/Deno | TypeScript/Deno |
| Quality Tools | None | PMAT, bashrs | PMAT, bashrs, Deno | PMAT, bashrs, Deno |
| Working Examples | 1 (conversion) | 1 (bashrs) | 4 (scanners) | 1 (full app) |
| Test Infrastructure | External | Cargo, bash | Deno test | Deno test |
| Bonus Exercises | 2 | 1 | N/A | N/A |
| Lab Count | 6 + 2 bonus | 12 + 1 bonus | Varied | Varied |

---

**Document Version**: 1.0
**Specification Owner**: PAIML Team
**Last Review**: 2025-11-14
**Next Review**: As needed for course updates
