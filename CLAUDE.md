# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository contains Course 2 of the **GitHub Copilot Mastery Pathway**, a partnership with LinkedIn Learning. The course "GitHub Copilot for System-Level Development" is approximately 60 minutes and teaches developers how to leverage GitHub Copilot for test-driven development, large-scale refactoring, and infrastructure automation.

This is an educational course repository containing lab exercises, working examples, and documentation rather than production application code.

## Course Context

**Course Series**: GitHub Copilot Mastery Pathway (4 courses total)

- Course 1: Advanced Prompting with GitHub Copilot
- **Course 2**: GitHub Copilot for System-Level Development (this repo)
- Course 3: Responsible AI Development with GitHub Copilot
- Course 4: Capstone: Building Production Features with Copilot

**Partner**: LinkedIn Learning
**Format**: ~60 minutes, 3-5 minute videos per lesson
**Target Audience**: Developers with GitHub Copilot experience seeking system-level development skills

## Repository Structure

```
/
├── README.md                        # Course overview and module descriptions
├── CLAUDE.md                       # This file - guidance for AI assistants
├── LICENSE                         # MIT license
├── Makefile                        # Quality gates, testing, validation
├── .gitignore                      # Git ignore patterns
├── .markdownlint.json              # Markdown linting configuration
├── .pre-commit-config.yaml         # Pre-commit hooks configuration
├── .github/                        # GitHub-specific files
│   ├── workflows/
│   │   └── ci.yml                  # CI/CD quality gates
│   └── header.svg                  # Course banner image
├── docs/                           # Documentation and specifications
│   ├── specifications/
│   │   └── course-repo-layout.md   # Repository structure specification
│   └── quality/
│       └── repo-score.md           # PMAT repository health metrics
├── labs/                           # Hands-on lab exercises
│   ├── module1/                    # TDD labs (5 labs)
│   ├── module2/                    # Refactoring labs (4 labs)
│   ├── module3/                    # Infrastructure labs (3 labs)
│   └── bonus/                      # Advanced bonus exercises (1 lab)
├── examples/                       # Working code examples
│   └── bashrs-cleanup/             # Shell script quality improvement
│       ├── README.md
│       ├── scripts/
│       └── tests/
└── resources/                      # Additional learning resources
    ├── redactr-reference.md
    ├── pmat-integration.md
    └── bashrs-integration.md
```

## Course Structure

### Module 1: AI-Augmented Test-Driven Development (6 videos)

- 2.1.1 Introduction to AI-assisted TDD
- 2.1.2 Generating complex test suites
- 2.1.3 Mocking dependencies with Copilot
- 2.1.4 Challenge: TDD for a new feature
- 2.1.5 Solution: TDD for a new feature
- 2.1.6 Evaluating test coverage

**Labs**: 5 labs covering TDD fundamentals, complex test generation, mocking, challenges, and coverage

### Module 2: Large-Scale Refactoring (6 videos)

- 2.2.1 Strategic use of workspace
- 2.2.2 Analyzing cross-file dependencies
- 2.2.3 Challenge: System-wide code cleanup
- 2.2.4 Solution: System-wide code cleanup
- 2.2.5 Enforcing styles and constraints
- 2.2.6 Generating guidelines for specific tasks

**Labs**: 4 labs covering workspace strategies, dependency analysis, cleanup, and style enforcement

### Module 3: Infrastructure as Code with Copilot (4 videos)

- 2.3.1 Generating IaC configurations
- 2.3.2 Creating Dockerfiles with AI
- 2.3.3 Terraform configuration generation
- 2.3.4 Course wrap-up

**Labs**: 3 labs covering IaC generation, Dockerfiles, and Terraform

### Bonus Exercises (1 advanced exercise)

- Shell script quality improvement using bashrs and GitHub Copilot prompts

**Focus**: Real-world system administration, quality tooling integration, AI-assisted code cleanup

## Lab Structure and Patterns

Each lab follows a consistent structure:

- **Overview**: Brief description of learning objectives
- **Prerequisites**: Required knowledge, tools, and prior lab completion
- **Setup**: Environment configuration and repository cloning
- **Tasks**: 4-10 numbered hands-on exercises with progressive difficulty
- **Expected Outcomes**: Concrete skills students should gain
- **Reflection Questions**: Prompts for deeper understanding
- **Success Criteria**: Clear completion metrics
- **Next Steps**: Preview of following labs or application guidance

### Key Learning Themes Across Labs

- **Test-Driven Development**: Red-Green-Refactor cycle with AI assistance
- **Workspace Strategies**: Using @workspace for large codebase navigation
- **Dependency Management**: Understanding and mocking external dependencies
- **Code Quality**: Systematic refactoring and style enforcement
- **Infrastructure Automation**: Generating and validating IaC configurations
- **Quality Tooling**: Integration with PMAT, bashrs, and other professional tools

### Practice Repositories Referenced

Labs direct students to practice on the **redactr** repository:

- **redactr** (https://github.com/alfredodeza/redactr) - Rust HTTP microservice for PII redaction
  - System-level Rust programming
  - HTTP service architecture
  - Comprehensive test suite
  - Production-ready code organization

### Quality Tools Integration

- **PMAT** (https://github.com/paiml/paiml-mcp-agent-toolkit) - Documentation validation and repository health scoring
- **bashrs** (https://github.com/paiml/bashrs) - Makefile and shell script linting/formatting

## Working with This Repository

### Editing Course Content

When modifying labs:

- Maintain the established module structure (module1/module2/module3)
- Preserve the consistent lab format (Overview → Prerequisites → Setup → Tasks → Outcomes → Reflection → Success)
- Keep code examples in fenced blocks with language specifiers (```bash, ```rust, ```yaml)
- Ensure labs remain aligned with the video content structure
- Maintain the progressive difficulty curve across modules
- Reference the redactr repository for practical exercises

### Updating README

The README should:

- Clearly identify this as Course 2 in the 4-course pathway
- List all three modules with their video topics
- Organize labs by module (Module 1/2/3 Labs sections)
- Reference LinkedIn Learning partnership
- Include the ~60 minute duration
- Highlight quality tools integration (PMAT, bashrs)
- Link to related courses in the pathway

### Creating New Content

If adding new labs:

- Place in appropriate module subdirectory (module1/2/3) or bonus/
- Follow established numbering: Module 1 has labs 1-5, Module 2 has labs 6-9, Module 3 has labs 10-12
- Bonus exercises use bonus1-, bonus2- prefixes
- Align content with the module's learning objectives
- Reference redactr repository for Rust/system-level exercises
- Include both challenge and reflection components
- Test all code examples and commands

For bonus exercises:

- Focus on advanced, real-world applications
- May require additional tools beyond core course requirements (bashrs, PMAT, etc.)
- Should demonstrate integration of multiple course concepts
- Include links to external resources and tool documentation
- Provide clear success criteria and expected outcomes

### Working with Examples

The `examples/bashrs-cleanup/` directory contains:

- **Messy shell script**: Demonstrates common quality issues (poor quoting, inconsistent style, etc.)
- **Clean shell script**: Shows best practices after AI-assisted cleanup
- **Prompts documentation**: GitHub Copilot prompts used for the cleanup
- **Test validation**: Scripts to verify both versions work correctly

When updating examples:

- Ensure both messy and clean versions are functionally equivalent
- Document all prompts used with GitHub Copilot
- Include bashrs lint output showing improvements
- Add comments explaining quality improvements
- Test scripts thoroughly before committing

## Quality Standards

This repository maintains strict quality standards:

### Required Quality Gates

All changes must pass:

- `make lint` - Makefile linting (bashrs) and markdown linting (markdownlint-cli2)
- `make test` - All tests including example validation
- `make validate` - Repository structure and documentation validation
- `make validate-docs` - PMAT link validation (all links must be valid)
- `make repo-score` - PMAT repository health score (target: 90+/110)

### CI/CD Requirements

GitHub Actions workflow (`.github/workflows/ci.yml`) runs on all pushes and PRs:

- Pre-commit hooks validation
- Markdown and Makefile linting
- Repository structure validation
- Example tests (if applicable)

### Pre-commit Hooks

The `.pre-commit-config.yaml` file defines hooks that run before each commit:

- Trailing whitespace removal
- End-of-file fixer
- YAML validation
- Large file detection (max 1MB)
- Merge conflict detection
- Markdown linting

Install pre-commit hooks:

```bash
pip install pre-commit
pre-commit install
```

### Documentation Quality

All markdown files must:

- Pass markdownlint-cli2 validation (configured in `.markdownlint.json`)
- Have valid internal and external links (verified by PMAT)
- Use fenced code blocks with language specifiers
- Follow consistent heading hierarchy
- Maintain reasonable line length (120 chars max for prose)
- Include blank lines around headings and lists

## Important Notes

- This is educational content about GitHub Copilot, not a production application
- Build/test/CI infrastructure validates documentation and examples, not application code
- Labs reference the redactr repository for hands-on Rust/systems programming practice
- Course is focused on system-level development (TDD, refactoring, IaC) not web development
- Focus is on practical techniques and professional workflows, not toy examples
- Quality tooling (PMAT, bashrs) demonstrates professional development practices

## Comparison with Other Courses in the Series

### Course 1: Advanced Prompting

- Focus: Prompting techniques and conversational AI
- Content: Minimal executable code, references external repos
- Tools: GitHub Copilot only
- Examples: Python-to-Rust CLI conversion

### Course 2: System-Level Development (This Course)

- Focus: TDD, large-scale refactoring, infrastructure automation
- Content: Working shell script examples, comprehensive labs
- Tools: GitHub Copilot + PMAT + bashrs
- Examples: bashrs shell script cleanup
- Practice Repo: redactr (Rust microservice)

### Course 3: Responsible AI Development

- Focus: Code validation, security scanning, customization
- Content: Complete TypeScript security tools (4 scanners)
- Tools: GitHub Copilot + Deno + PMAT + bashrs
- Examples: Multiple working security scanners

### Course 4: Capstone

- Focus: Full-stack production feature development
- Content: Complete application with API, business logic, data layer
- Tools: GitHub Copilot + Deno + PMAT + comprehensive testing
- Examples: Production-ready TypeScript application

## Making Changes

When making changes to this repository:

1. **Create a feature branch** (or work directly on main per user's CLAUDE.md global config)
2. **Make your changes** following the structure and patterns above
3. **Run quality gates locally**:
   ```bash
   make validate     # Full validation
   make lint         # Quick linting check
   make test         # Run all tests
   ```
4. **Commit with descriptive messages**
5. **Ensure CI passes** if pushing to GitHub

## Resources

- [Course 1: Advanced Prompting](https://github.com/paiml/advanced-prompting-with-github-copilot)
- [Course 3: Responsible AI Development](https://github.com/paiml/responsible-ai-dev)
- [Course 4: Capstone](https://github.com/paiml/GitHub-Copilot-Mastery-Capstone)
- [redactr Practice Repository](https://github.com/alfredodeza/redactr)
- [PMAT Toolkit](https://github.com/paiml/paiml-mcp-agent-toolkit)
- [bashrs](https://github.com/paiml/bashrs)
- [GitHub Copilot Documentation](https://docs.github.com/en/copilot)

## Help and Support

For issues or questions:

- Review existing lab content and examples
- Check the specification in `docs/specifications/course-repo-layout.md`
- Run `make help` to see available commands
- Validate changes with `make validate` before committing
