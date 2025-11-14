<h1 align="center">GitHub Copilot for System-Level Development</h1>
<h5 align="center">Master AI-assisted development for systems programming, testing, and infrastructure automation</h5>

<p align="center">
  <img src=".github/systems-progression.svg" alt="System-Level Development Progression" width="1200">
</p>

<p align="center">
  <a href="https://github.com/paiml/ghcp-for-systems-level-development/actions/workflows/ci.yml">
    <img src="https://github.com/paiml/ghcp-for-systems-level-development/actions/workflows/ci.yml/badge.svg" alt="CI Status">
  </a>
  <a href="https://github.com/paiml/ghcp-for-systems-level-development">
    <img src="https://img.shields.io/badge/PMAT_Repo_Score-66%2F100-yellow" alt="PMAT Repo Score">
  </a>
  <a href="https://github.com/paiml/ghcp-for-systems-level-development">
    <img src="https://img.shields.io/badge/Course-2_of_4-blue" alt="Course 2 of 4">
  </a>
</p>

<p align="center">
  <a href="#about-this-course">About</a> •
  <a href="#learning-objectives">Learning Objectives</a> •
  <a href="#course-modules">Modules</a> •
  <a href="#labs">Labs</a> •
  <a href="#resources">Resources</a>
</p>

---

**📚 Course 2 of the GitHub Copilot Mastery Pathway**
⏱️ *Duration: ~60 minutes*

## 📖 About This Course

## Overview

Welcome to "GitHub Copilot for System-Level Development"! This course builds on foundational prompting techniques to tackle complex system-level challenges including test-driven development, large-scale refactoring, and infrastructure automation. You'll learn how to leverage GitHub Copilot for generating comprehensive test suites, navigating sprawling codebases, and creating production-ready infrastructure configurations.

This is the second course in the GitHub Copilot Mastery Pathway, designed to advance your skills from effective prompting to professional system-level development workflows.

## 🎯 Learning Objectives

By the end of this course, you will be able to:

* ✅ Implement test-driven development (TDD) workflows with GitHub Copilot
* ✅ Generate and refine complex test suites with mocking and edge case coverage
* ✅ Strategically navigate and refactor large, multi-file codebases
* ✅ Analyze cross-file dependencies in complex projects
* ✅ Perform system-wide code cleanup and style enforcement
* ✅ Generate infrastructure as code (IaC) configurations
* ✅ Create production-ready Dockerfiles with AI assistance
* ✅ Develop Terraform and Ansible automation scripts
* ✅ Evaluate and improve test coverage systematically

## 📚 Course Modules

### Module 1: AI-Augmented Test-Driven Development
- 🧪 Introduction to AI-assisted TDD workflows
- 📝 Generating complex test suites with edge cases
- 🎭 Mocking dependencies and external services
- 🎯 **Challenge**: TDD for a new feature
- ✅ **Solution**: TDD for a new feature walkthrough
- 📊 Evaluating and improving test coverage

### Module 2: Large-Scale Refactoring
- 🗺️ Strategic use of workspace commands for navigation
- 🔗 Analyzing cross-file dependencies
- 🎯 **Challenge**: System-wide code cleanup
- ✅ **Solution**: System-wide code cleanup walkthrough
- 🎨 Enforcing coding styles and constraints
- 📋 Generating project-specific guidelines

### Module 3: Infrastructure as Code with Copilot
- ⚙️ Generating IaC configurations
- 🐳 Creating Dockerfiles with AI
- 🏗️ Terraform configuration generation
- 🎓 Course wrap-up and next steps

## 🧪 Labs

This course includes hands-on labs organized by module to reinforce your learning. Each lab provides practical experience with the concepts covered in the videos.

### Module 1 Labs: AI-Augmented Test-Driven Development
* [Lab 1: Introduction to AI-Assisted TDD](labs/module1/1-introduction-to-tdd-lab.md)
* [Lab 2: Generating Complex Test Suites](labs/module1/2-complex-test-suites-lab.md)
* [Lab 3: Mocking Dependencies with Copilot](labs/module1/3-mocking-dependencies-lab.md)
* [Lab 4: Challenge - TDD for a New Feature](labs/module1/4-tdd-challenge-lab.md)
* [Lab 5: Evaluating Test Coverage](labs/module1/5-test-coverage-lab.md)

### Module 2 Labs: Large-Scale Refactoring
* [Lab 6: Strategic Use of Workspace](labs/module2/6-workspace-strategies-lab.md)
* [Lab 7: Analyzing Cross-File Dependencies](labs/module2/7-cross-file-dependencies-lab.md)
* [Lab 8: System-Wide Code Cleanup](labs/module2/8-system-cleanup-lab.md)
* [Lab 9: Enforcing Styles and Constraints](labs/module2/9-enforcing-styles-lab.md)

### Module 3 Labs: Infrastructure as Code with AI
* [Lab 10: Generating IaC Configurations](labs/module3/10-iac-configurations-lab.md)
* [Lab 11: Creating Dockerfiles with AI](labs/module3/11-dockerfiles-lab.md)
* [Lab 12: Terraform Configuration Generation](labs/module3/12-terraform-lab.md)

### 🏆 Bonus Exercises: Advanced Applications
* **[Bonus 1: Shell Script Quality with bashrs](labs/bonus/bonus1-bashrs-cleanup.md)** - 🔧 Use GitHub Copilot prompts to clean up shell scripts using bashrs quality tools

## 💻 Working Example

This repository includes a complete working example demonstrating shell script quality improvement:

📂 [**bashrs Shell Script Cleanup Example**](examples/bashrs-cleanup/) - A fully functional demonstration with:
* 🔴 Messy shell script with 9+ quality issues
* ✅ Clean version following best practices
* 📝 Documented GitHub Copilot prompts for each transformation
* 🧪 Comprehensive test suite for validation
* 📊 Before/after quality comparison

Run the example:
```bash
# Build and test
make example-test

# Just build
make example-build

# See quality improvements
bashrs lint examples/bashrs-cleanup/scripts/messy-deploy.sh
bashrs lint examples/bashrs-cleanup/scripts/clean-deploy.sh
```

## 🎯 Practice Repository

This course uses [**redactr**](https://github.com/alfredodeza/redactr) as the primary practice repository - a Rust HTTP microservice for PII redaction.

**Repository**: https://github.com/alfredodeza/redactr

This repository is ideal for practicing because it:
* ✅ Real-world system-level Rust project
* ✅ HTTP microservice architecture
* ✅ Regular expression-based text processing
* ✅ Comprehensive test suite structure
* ✅ Production-ready code organization
* ✅ Active development with real-world patterns

Clone the repository to follow along:
```bash
git clone https://github.com/alfredodeza/redactr.git
cd redactr
cargo test  # Verify setup
```

## Quality Tools Integration

This course leverages professional-grade quality tools:

### PMAT (PAIML MCP Agent Toolkit)
Documentation validation and repository health scoring:

```bash
# Validate all documentation links
make validate-docs

# Check repository health score
make repo-score
```

Learn more: [PMAT Documentation](https://github.com/paiml/paiml-mcp-agent-toolkit)

### bashrs
Makefile and shell script linting/formatting:

```bash
# Lint Makefile
make lint

# Lint shell scripts
bashrs lint examples/bashrs-cleanup/scripts/*.sh
```

Learn more: [bashrs Documentation](https://github.com/paiml/bashrs)

## 📦 Installation

### Prerequisites

Before starting the labs, ensure you have:

1. **🤖 GitHub Copilot Access**: An active GitHub Copilot subscription (individual, business, or enterprise)
2. **💻 IDE Setup**: Visual Studio Code or a JetBrains IDE with GitHub Copilot extension installed
3. **📦 Git**: Installed and configured on your system
4. **🦀 Rust**: For working with the redactr practice repository and quality tools

### 🚀 Quick Start

1. **Clone this repository**:
   ```bash
   git clone https://github.com/paiml/ghcp-for-systems-level-development
   cd ghcp-for-systems-level-development
   ```

2. **Install dependencies**:
   ```bash
   make install
   ```

3. **Run tests to verify setup**:
   ```bash
   make test
   ```

4. **Optional: Clone practice repository**:
   ```bash
   git clone https://github.com/alfredodeza/redactr
   cd redactr
   cargo test
   ```

## 🎮 Usage

### Working with the Course

1. **Start with Module 1 labs** in `labs/module1/`
2. **Open the repository in your IDE** with GitHub Copilot enabled
3. **Follow along with video content** and complete hands-on exercises
4. **Practice on the redactr repository** to reinforce learning
5. **Complete bonus exercises** for advanced applications

### Running the Example

Build and test the bashrs cleanup example:

```bash
# Run all tests
make example-test

# Just build the example
make example-build

# Clean build artifacts
make example-clean
```

### Available Commands

```bash
make help           # Show all available commands
make install        # Install all dependencies
make lint           # Run all linting
make test           # Run all tests
make validate       # Validate repository structure
make example-test   # Test the working example
make repo-score     # Check repository health score
```

## 📚 Resources

Use the following tools and resources to enhance your experience when working with this course:

* [GitHub Copilot Documentation](https://docs.github.com/en/copilot)
* [GitHub Copilot Chat](https://docs.github.com/en/copilot/concepts/chat)
* [GitHub Copilot in VS Code](https://code.visualstudio.com/docs/copilot/overview)
* [JetBrains GitHub Copilot Plugin](https://plugins.jetbrains.com/plugin/17718-github-copilot)
* [Redactr Practice Repository](https://github.com/alfredodeza/redactr)
* [Rust Documentation](https://doc.rust-lang.org/)
* [Docker Documentation](https://docs.docker.com/)
* [Terraform Documentation](https://www.terraform.io/docs)
* [Ansible Documentation](https://docs.ansible.com/)
* [PMAT Toolkit](https://github.com/paiml/paiml-mcp-agent-toolkit)
* [bashrs](https://github.com/paiml/bashrs)
* [Pragmatic AI Labs](https://paiml.com)

## 🎓 Part of the GitHub Copilot Mastery Pathway

This course is **Course 2** in a 4-course series:

1. **📚 Advanced Prompting with GitHub Copilot** - [Repository](https://github.com/paiml/advanced-prompting-with-github-copilot)
2. **🔧 GitHub Copilot for System-Level Development** (this course) - [Repository](https://github.com/paiml/ghcp-for-systems-level-development)
3. **🛡️ Responsible AI Development with GitHub Copilot** - [Repository](https://github.com/paiml/responsible-ai-dev)
4. **🏆 Capstone: Building Production Features with Copilot** - [Repository](https://github.com/paiml/GitHub-Copilot-Mastery-Capstone)

## Quality Standards

This repository maintains strict quality standards:

- ✅ **Documentation Validation**: All links verified with PMAT
- ✅ **Makefile Quality**: Linted with bashrs
- ✅ **Repository Health**: Scored with PMAT (target: 90+/110)
- ✅ **CI/CD**: Automated quality gates on all commits
- ✅ **Test Coverage**: Working examples with validation

Run quality checks:

```bash
make validate      # Run all quality gates
make validate-docs # Validate documentation links
make repo-score    # Check repository health
make lint          # Lint Makefiles and markdown
```

## 💡 Tips for Success

* 🧪 **Start with TDD**: Write tests before implementation - it improves code quality
* 🗺️ **Use Workspace Commands**: @workspace helps Copilot understand large codebases
* 🔄 **Iterate on Tests**: Generate tests first, then refine with edge cases
* 📂 **Context is Key**: Keep relevant files open for better suggestions
* 🔍 **Review Infrastructure**: Always review generated IaC configs before deploying
* ✅ **Validate Everything**: Use tools like PMAT and bashrs to catch issues early
* 🎯 **Practice Refactoring**: Large-scale refactoring skills transfer across languages
* 📝 **Document Your Prompts**: Save effective prompts for reuse in similar scenarios
* 🧪 **Experiment**: Try different prompting approaches to find what works best

## 🤝 Contributing

### Ways to Contribute

- 🐛 **Report Issues**: Found a bug or broken link? [Open an issue](https://github.com/paiml/ghcp-for-systems-level-development/issues)
- 💡 **Suggest Improvements**: Have ideas for new labs or content? Share them!
- 📝 **Fix Documentation**: Improve clarity, fix typos, or add examples
- ✨ **Add Examples**: Contribute additional working examples or exercises

### Development Workflow

All contributions must meet these standards:

- ✅ Pass all linting checks (`make lint`)
- ✅ Pass all tests (`make test`)
- ✅ Include documentation for new features
- ✅ Follow existing code style and patterns
- ✅ Update CLAUDE.md if repository structure changes

## 📄 License

Copyright © 2025 Pragmatic AI Labs

This course material is provided for educational purposes. All rights reserved.

For licensing inquiries, contact [Pragmatic AI Labs](https://paiml.com).

---

<p align="center">
  Made with ❤️ by <a href="https://paiml.com">Pragmatic AI Labs</a>
</p>
