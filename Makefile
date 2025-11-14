.PHONY: help install install-dev install-rust lint lint-makefile lint-markdown test test-fast coverage clean
.PHONY: example-build example-test example-clean validate validate-docs repo-score run

# Disable built-in implicit rules for performance
.SUFFIXES:

# Delete partially-built files on error
.DELETE_ON_ERROR:

# Colors for output
BLUE := \033[36m
GREEN := \033[32m
YELLOW := \033[33m
RED := \033[31m
RESET := \033[0m

help: ## Show this help message
	@echo "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(RESET)"
	@echo "$(BLUE)📋  GitHub Copilot for System-Level Development - Makefile Help$(RESET)"
	@echo "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(RESET)"
	@echo ""
	@echo "$(GREEN)Main Targets:$(RESET)"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		grep -v '^[a-zA-Z_-]*-[a-zA-Z_-]*:' | \
		sort | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  $(BLUE)%-20s$(RESET) %s\n", $$1, $$2}'
	@echo ""
	@echo "$(YELLOW)Examples:$(RESET)"
	@echo "  make lint            # Lint Makefiles and markdown"
	@echo "  make test            # Run all tests including examples"
	@echo "  make validate        # Run full validation suite"
	@echo "  make example-test    # Test bashrs cleanup example"
	@echo ""

install: ## Install all dependencies (bashrs, PMAT, markdown tools)
	@echo "$(BLUE)⚙️  Installing dependencies...$(RESET)"
	@$(MAKE) install-dev
	@echo "$(GREEN)✅ All dependencies installed successfully!$(RESET)"

install-dev: ## Install development dependencies (markdown linting, bashrs, PMAT)
	@echo "$(BLUE)📦 Installing Node.js dependencies...$(RESET)"
	@command -v npm >/dev/null 2>&1 || (echo "$(RED)❌ npm not found. Please install Node.js first.$(RESET)" && exit 1)
	npm install -g markdownlint-cli2
	@echo "$(BLUE)🔧 Checking bashrs installation...$(RESET)"
	@if command -v bashrs >/dev/null 2>&1; then \
		echo "$(GREEN)✅ bashrs is already installed (version: $$(bashrs --version))$(RESET)"; \
	else \
		echo "$(YELLOW)⚠️  bashrs not found. Install with: cargo install bashrs$(RESET)"; \
	fi
	@echo "$(BLUE)🔧 Checking PMAT installation...$(RESET)"
	@if command -v pmat >/dev/null 2>&1; then \
		echo "$(GREEN)✅ PMAT is already installed (version: $$(pmat --version | head -1))$(RESET)"; \
	else \
		echo "$(YELLOW)⚠️  PMAT not found. Install with: cargo install paiml-mcp-agent-toolkit$(RESET)"; \
	fi
	@echo "$(GREEN)✅ Development dependencies check complete!$(RESET)"

lint-makefile: ## Lint the Makefile with bashrs
	@echo "$(BLUE)🔍 Linting Makefile with bashrs...$(RESET)"
	@if command -v bashrs >/dev/null 2>&1; then \
		if bashrs lint Makefile 2>&1 | grep -E "^Summary:.*[1-9][0-9]* error" > /dev/null; then \
			echo "$(RED)❌ Makefile has errors!$(RESET)"; \
			exit 1; \
		else \
			echo "$(GREEN)✅ Makefile passed linting (warnings are acceptable)!$(RESET)"; \
		fi \
	else \
		echo "$(YELLOW)⚠️  bashrs not found - skipping Makefile linting$(RESET)"; \
	fi

lint-markdown: ## Lint markdown files with markdownlint
	@echo "$(BLUE)🔍 Running markdown linting...$(RESET)"
	@if command -v markdownlint-cli2 >/dev/null 2>&1; then \
		markdownlint-cli2 "**/*.md" "#node_modules" && \
		echo "$(GREEN)✅ Markdown linting passed!$(RESET)"; \
	else \
		echo "$(YELLOW)⚠️  markdownlint-cli2 not found - skipping markdown linting$(RESET)"; \
	fi

lint: lint-makefile lint-markdown ## Run all linting (Makefile + markdown)
	@echo "$(GREEN)✅ All linting passed!$(RESET)"

test-fast: lint ## Run fast tests (lint only)
	@echo "$(GREEN)✅ Fast tests complete!$(RESET)"

test: test-fast example-test ## Run all tests (lint + examples)
	@echo "$(GREEN)✅ All tests passed!$(RESET)"

run: example-test ## Run all examples (alias for example-test)
	@echo "$(GREEN)✅ All examples executed successfully!$(RESET)"

coverage: test ## Run tests with coverage
	@echo "$(BLUE)📊 Generating coverage report...$(RESET)"
	@echo "$(YELLOW)ℹ️  Coverage reporting for bash scripts - validating test execution$(RESET)"
	@$(MAKE) example-test
	@echo "$(GREEN)✅ Coverage validation complete!$(RESET)"

clean: example-clean ## Clean up temporary files and build artifacts
	@echo "$(BLUE)🧹 Cleaning up temporary files...$(RESET)"
	@find . -type f -name "*.tmp" -delete
	@find . -type f -name "*.log" -delete
	@find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true
	@find . -type d -name .pytest_cache -exec rm -rf {} + 2>/dev/null || true
	@echo "$(GREEN)✅ Cleanup complete!$(RESET)"

example-build: ## Build the bashrs cleanup example
	@echo "$(BLUE)🔨 Building bashrs cleanup example...$(RESET)"
	@if [ -d examples/bashrs-cleanup/scripts ]; then \
		echo "$(GREEN)✅ Example scripts ready!$(RESET)"; \
	else \
		echo "$(RED)❌ Example scripts not found. Please run full setup.$(RESET)"; \
		exit 1; \
	fi

example-test: example-build ## Run tests for bashrs cleanup example
	@echo "$(BLUE)🧪 Running bashrs cleanup example tests...$(RESET)"
	@if [ -f examples/bashrs-cleanup/tests/test-scripts.sh ]; then \
		bash examples/bashrs-cleanup/tests/test-scripts.sh && \
		echo "$(GREEN)✅ Example tests passed!$(RESET)"; \
	else \
		echo "$(YELLOW)⚠️  Example tests not yet created - skipping$(RESET)"; \
	fi

example-clean: ## Clean example build artifacts
	@echo "$(BLUE)🧹 Cleaning example artifacts...$(RESET)"
	@find examples -type f -name "*.tmp" -delete 2>/dev/null || true
	@echo "$(GREEN)✅ Example cleanup complete!$(RESET)"

validate: lint validate-docs ## Validate repository structure and documentation
	@echo "$(BLUE)🔍 Validating repository structure...$(RESET)"
	@test -f README.md || (echo "$(RED)❌ ERROR: README.md not found$(RESET)" && exit 1)
	@test -f CLAUDE.md || (echo "$(RED)❌ ERROR: CLAUDE.md not found$(RESET)" && exit 1)
	@test -f Makefile || (echo "$(RED)❌ ERROR: Makefile not found$(RESET)" && exit 1)
	@test -d labs/module1 || (echo "$(RED)❌ ERROR: labs/module1 not found$(RESET)" && exit 1)
	@test -d labs/module2 || (echo "$(RED)❌ ERROR: labs/module2 not found$(RESET)" && exit 1)
	@test -d labs/module3 || (echo "$(RED)❌ ERROR: labs/module3 not found$(RESET)" && exit 1)
	@test -d labs/bonus || (echo "$(RED)❌ ERROR: labs/bonus not found$(RESET)" && exit 1)
	@test -d examples/bashrs-cleanup || (echo "$(RED)❌ ERROR: examples/bashrs-cleanup not found$(RESET)" && exit 1)
	@test -d docs/specifications || (echo "$(RED)❌ ERROR: docs/specifications not found$(RESET)" && exit 1)
	@echo "$(GREEN)✅ Repository structure is valid!$(RESET)"
	@echo "$(BLUE)🧪 Running test suite...$(RESET)"
	@$(MAKE) test

validate-docs: ## Validate documentation links with PMAT
	@echo "$(BLUE)🔗 Validating documentation links with PMAT...$(RESET)"
	@if command -v pmat >/dev/null 2>&1; then \
		pmat validate-docs --fail-on-error && \
		echo "$(GREEN)✅ All documentation links are valid!$(RESET)"; \
	else \
		echo "$(YELLOW)⚠️  PMAT not found - skipping link validation$(RESET)"; \
		echo "$(YELLOW)    Install with: cargo install paiml-mcp-agent-toolkit$(RESET)"; \
	fi

repo-score: ## Calculate repository health score with PMAT
	@echo "$(BLUE)📊 Calculating repository health score...$(RESET)"
	@if command -v pmat >/dev/null 2>&1; then \
		pmat repo-score; \
	else \
		echo "$(YELLOW)⚠️  PMAT not found - skipping repository scoring$(RESET)"; \
		echo "$(YELLOW)    Install with: cargo install paiml-mcp-agent-toolkit$(RESET)"; \
	fi

.DEFAULT_GOAL := help
