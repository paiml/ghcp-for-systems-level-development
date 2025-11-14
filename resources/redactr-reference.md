# redactr Practice Repository Reference

This guide helps you work effectively with the [redactr](https://github.com/alfredodeza/redactr) Rust microservice used throughout this course.

## Overview

**redactr** is a simple HTTP microservice that accepts JSON strings as input and returns JSON with personal identity information (PII) redacted based on regular expressions.

- **Repository**: https://github.com/alfredodeza/redactr
- **Language**: Rust
- **Type**: HTTP microservice
- **Purpose**: Real-world system-level development practice

## Why redactr?

This repository is ideal for learning system-level development with GitHub Copilot because it:

- **System-level Rust** - Real compiled language, not scripting
- **HTTP service architecture** - Production-ready server patterns
- **Regular expression processing** - Text manipulation at scale
- **Comprehensive test suite** - TDD-friendly structure
- **Production code organization** - Professional project layout
- **Error handling patterns** - Robust failure modes
- **Performance considerations** - Efficient text processing

## Getting Started

### Clone and Setup

```bash
# Clone the repository
git clone https://github.com/alfredodeza/redactr.git
cd redactr

# Build the project
cargo build

# Run tests
cargo test

# Run the service
cargo run
```

### Project Structure

```
redactr/
├── src/
│   ├── main.rs          # HTTP server entry point
│   ├── lib.rs           # Core redaction logic
│   └── patterns.rs      # Regex patterns for PII
├── tests/
│   └── integration/     # Integration tests
├── Cargo.toml           # Rust dependencies
└── README.md
```

## Using redactr for Course Labs

### Module 1: AI-Augmented Test-Driven Development

**Lab Focus**: Writing tests before implementation

**Exercises with redactr**:

1. **Generate test suites** - Use GitHub Copilot to create tests for new PII patterns
   ```rust
   #[test]
   fn test_redact_credit_card() {
       let input = "Card: 4532-1234-5678-9010";
       let result = redact(input);
       assert_eq!(result, "Card: [REDACTED]");
   }
   ```

2. **Mock HTTP dependencies** - Test server responses without running the server
   ```rust
   // Use Copilot to generate mock HTTP request/response tests
   ```

3. **Test coverage analysis** - Run `cargo tarpaulin` to measure coverage
   ```bash
   cargo tarpaulin --out Html
   ```

### Module 2: Large-Scale Refactoring

**Lab Focus**: Navigating and refactoring large codebases

**Exercises with redactr**:

1. **Workspace analysis** - Use `@workspace` in GitHub Copilot Chat
   ```
   @workspace How are regex patterns organized in this codebase?
   @workspace Where is error handling implemented?
   @workspace Show me all functions that process user input
   ```

2. **Cross-file dependencies** - Understand module relationships
   ```
   @workspace What modules depend on patterns.rs?
   @workspace How does main.rs interact with lib.rs?
   ```

3. **Refactoring with Copilot** - Improve code organization
   - Extract pattern definitions into separate files
   - Create pattern categories (financial, personal, medical)
   - Add builder pattern for configuration

### Module 3: Infrastructure as Code

**Lab Focus**: Deploying microservices

**Exercises with redactr**:

1. **Generate Dockerfile** - Use Copilot to create multi-stage build
   ```dockerfile
   # Prompt: Create a multi-stage Dockerfile for this Rust microservice
   # that minimizes image size and runs as non-root user
   ```

2. **Create docker-compose** - Local development environment
   ```yaml
   # Prompt: Create docker-compose.yml with redactr service,
   # nginx reverse proxy, and health checks
   ```

3. **Terraform deployment** - Cloud infrastructure
   ```hcl
   # Prompt: Generate Terraform config to deploy this microservice
   # to AWS ECS with load balancer and auto-scaling
   ```

## Common GitHub Copilot Prompts for redactr

### TDD Prompts

```
Write a test that verifies email addresses are correctly redacted
Generate edge case tests for the redaction logic (empty strings, special chars)
Create a test suite for validating HTTP response formats
Write property-based tests using quickcheck for redaction invariants
```

### Refactoring Prompts

```
Suggest how to organize regex patterns into categories
Refactor the main HTTP handler to use middleware pattern
Extract error handling into a dedicated module
Add logging with structured output using tracing
```

### Infrastructure Prompts

```
Create a Dockerfile with optimal layer caching for Rust builds
Generate Kubernetes deployment manifest with liveness/readiness probes
Write Ansible playbook to deploy this service to Ubuntu servers
Create GitHub Actions workflow for CI/CD with cargo test and docker push
```

## Testing Strategies

### Unit Tests

```rust
// Test individual functions
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_pattern_matching() {
        // Test regex patterns in isolation
    }
}
```

### Integration Tests

```rust
// Test HTTP endpoints
#[tokio::test]
async fn test_redact_endpoint() {
    // Test full request/response cycle
}
```

### Benchmarks

```bash
# Add benchmarks to measure performance
cargo bench
```

## Advanced Topics

### Performance Profiling

```bash
# Profile with flamegraph
cargo flamegraph

# Memory profiling
valgrind --tool=massif target/release/redactr
```

### Security Analysis

```bash
# Check for security vulnerabilities
cargo audit

# Static analysis
cargo clippy -- -D warnings
```

### Documentation

```bash
# Generate and view docs
cargo doc --open
```

## Common Patterns to Practice

### Error Handling

```rust
// Use Result types consistently
pub fn redact(input: &str) -> Result<String, RedactError> {
    // Implementation
}
```

### Configuration

```rust
// Use builder pattern for config
let config = RedactConfig::builder()
    .pattern(Pattern::Email)
    .pattern(Pattern::CreditCard)
    .build()?;
```

### Middleware

```rust
// HTTP middleware for logging, auth, etc.
async fn logging_middleware(req: Request) -> Response {
    // Log request details
    let response = handle_request(req).await;
    // Log response details
    response
}
```

## Troubleshooting

### Build Issues

```bash
# Update Rust toolchain
rustup update

# Clean and rebuild
cargo clean && cargo build
```

### Test Failures

```bash
# Run tests with output
cargo test -- --nocapture

# Run specific test
cargo test test_name -- --exact
```

### Performance Issues

```bash
# Build with optimizations
cargo build --release

# Profile with release build
cargo bench
```

## Resources

- [Rust Book](https://doc.rust-lang.org/book/)
- [Rust by Example](https://doc.rust-lang.org/rust-by-example/)
- [Cargo Documentation](https://doc.rust-lang.org/cargo/)
- [tokio Documentation](https://tokio.rs/) - Async runtime
- [actix-web](https://actix.rs/) - HTTP framework (if used)
- [regex crate](https://docs.rs/regex/) - Regular expressions

## Next Steps

After working with redactr:

1. **Contribute improvements** - Submit PRs with new patterns or features
2. **Create your own microservice** - Apply patterns learned to new projects
3. **Deploy to production** - Practice full deployment lifecycle
4. **Scale the service** - Add load balancing, caching, monitoring
