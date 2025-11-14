# Lab 11: Creating Dockerfiles with AI

## Overview

In this lab, you will learn how to use GitHub Copilot to create production-ready Dockerfiles for containerizing applications. You'll work with the redactr Rust microservice to build efficient, secure container images.

## Setup

Ensure you have:
- The redactr repository cloned
- Docker installed and running
- GitHub Copilot enabled
- Basic understanding of containers

Install Docker if needed:
```bash
# Linux
curl -fsSL https://get.docker.com | sh

# macOS: Download Docker Desktop
# Windows: Download Docker Desktop
```

## Understanding Docker Containers

Docker provides:
- **Isolation**: Consistent environment across systems
- **Portability**: Run anywhere Docker runs
- **Efficiency**: Lightweight compared to VMs
- **Scalability**: Easy to replicate and orchestrate

## Tasks

### Task 1: Analyze Application Requirements

1. Review the redactr application to understand:
   - Build dependencies (Rust toolchain, cargo)
   - Runtime dependencies (system libraries)
   - Application structure
   - Configuration needs

2. Ask Copilot about containerization:
   ```
   "@workspace What are the requirements for containerizing this Rust application?"
   ```

3. Document required base images and tools

### Task 2: Generate Basic Dockerfile

1. Create a new file named `Dockerfile`

2. Write a comment describing what you need:
   ```dockerfile
   # Create a Dockerfile for a Rust microservice
   # Use multi-stage build to minimize final image size
   # Build stage: compile the Rust binary
   # Runtime stage: run the binary with minimal dependencies
   ```

3. Let Copilot generate the Dockerfile structure

4. Review the generated content

### Task 3: Implement Multi-Stage Build

A multi-stage build separates build and runtime environments:

1. Use Copilot to create a build stage:
   ```dockerfile
   # Stage 1: Build the application
   FROM rust:1.70 as builder

   # Let Copilot suggest the build steps
   ```

2. Create a minimal runtime stage:
   ```dockerfile
   # Stage 2: Create minimal runtime image
   FROM debian:bullseye-slim

   # Let Copilot suggest the runtime configuration
   ```

3. Ensure the binary is copied from builder to runtime stage

### Task 4: Optimize Image Size

1. Ask Copilot for optimization suggestions:
   ```
   "How can I reduce the size of this Docker image?"
   ```

2. Consider these optimizations:
   - Use Alpine Linux for smaller base (if compatible)
   - Remove build dependencies
   - Use `cargo build --release` for optimized binary
   - Strip debug symbols
   - Clean up package manager caches

3. Apply optimizations with Copilot's help

### Task 5: Add Security Best Practices

1. Run as non-root user:
   ```dockerfile
   # Create non-root user and run as that user
   ```

2. Use Copilot to generate user creation and permission setup

3. Add security enhancements:
   - Use specific version tags (not `latest`)
   - Minimize layers
   - Don't include secrets in the image
   - Use `.dockerignore` file

### Task 6: Create .dockerignore File

1. Generate a `.dockerignore` file:
   ```
   "Create a .dockerignore file for a Rust project that excludes:
   - target directory
   - .git directory
   - documentation files
   - test files
   - CI/CD configurations"
   ```

2. Review and adjust based on your project

### Task 7: Add Health Check

1. Add a health check to the Dockerfile:
   ```dockerfile
   # Add a health check that verifies the HTTP service is responding
   HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
   ```

2. Let Copilot complete the health check command

3. Verify the health check syntax

### Task 8: Build and Test the Image

1. Build the Docker image:
   ```bash
   docker build -t redactr:latest .
   ```

2. Check the image size:
   ```bash
   docker images redactr:latest
   ```

3. Run the container:
   ```bash
   docker run -p 8080:8080 redactr:latest
   ```

4. Test the service:
   ```bash
   curl http://localhost:8080/health
   # Or use the appropriate endpoint
   ```

5. Check health status:
   ```bash
   docker ps  # Look for health status
   ```

### Task 9: Create Docker Compose Configuration

1. Generate a `docker-compose.yml` file:
   ```
   "Create a docker-compose.yml file for the redactr service that:
   - Builds from the Dockerfile
   - Exposes port 8080
   - Mounts a volume for configuration
   - Sets environment variables
   - Includes restart policy"
   ```

2. Test with Docker Compose:
   ```bash
   docker-compose up
   ```

### Task 10: Document the Container

1. Create a `DOCKER.md` file:
   ```
   "Create documentation for the Docker setup including:
   - How to build the image
   - How to run the container
   - Configuration options
   - Environment variables
   - Volume mounts
   - Port mappings
   - Troubleshooting tips"
   ```

## Expected Outcomes

By the end of this lab, you should have:
- A production-ready multi-stage Dockerfile
- Optimized image size (< 100MB ideally)
- Security best practices implemented
- Working container that runs the application
- Docker Compose configuration
- Complete documentation

## Deliverables

1. **Dockerfile**: Multi-stage, optimized, secure
2. **.dockerignore**: Excludes unnecessary files
3. **docker-compose.yml**: Easy local development
4. **DOCKER.md**: Comprehensive documentation
5. **Working container**: Tested and verified

## Dockerfile Best Practices

### Security
- [ ] Run as non-root user
- [ ] Use specific version tags
- [ ] Don't include secrets
- [ ] Scan for vulnerabilities
- [ ] Minimize attack surface

### Optimization
- [ ] Multi-stage build
- [ ] Minimal base image
- [ ] Clean up caches
- [ ] Combine RUN commands
- [ ] Order layers efficiently (static to dynamic)

### Maintainability
- [ ] Clear comments
- [ ] Logical layer organization
- [ ] Version pinning
- [ ] Health checks
- [ ] Proper labels

## Image Size Comparison

Track your optimization progress:

| Stage | Image Size | Notes |
|-------|-----------|-------|
| Initial build | ___ MB | First attempt |
| Multi-stage | ___ MB | Separate build/runtime |
| Optimized | ___ MB | Cleaned up, minimal base |
| Final | ___ MB | All optimizations applied |

## Reflection Questions

1. How much did you reduce the image size through optimization?
2. What security improvements did you implement?
3. How did Copilot help with Docker best practices?
4. What challenges did you encounter during containerization?
5. How would you adapt this for different environments?

## Testing Checklist

- [ ] Image builds successfully
- [ ] Container starts without errors
- [ ] Application is accessible on expected port
- [ ] Health check passes
- [ ] Container restarts on failure
- [ ] Logs are accessible (`docker logs`)
- [ ] Resources are properly limited
- [ ] No security vulnerabilities (use `docker scan`)

## Advanced Exercise

If time permits:

1. **Multi-Architecture Builds**: Build for AMD64 and ARM64
   ```bash
   docker buildx build --platform linux/amd64,linux/arm64 -t redactr:multi .
   ```

2. **Container Registry**: Push to Docker Hub or GitHub Container Registry

3. **Kubernetes Deployment**: Create Kubernetes manifests

4. **CI/CD Integration**: Add Docker build to GitHub Actions

5. **Image Scanning**: Integrate Trivy or Snyk for security scanning

## Common Issues and Solutions

| Issue | Cause | Solution |
|-------|-------|----------|
| Build fails | Missing dependencies | Install in Dockerfile |
| Image too large | Including build tools in runtime | Use multi-stage build |
| Permission denied | Running as root | Create and use non-root user |
| Port not accessible | Not exposed or mapped | Add EXPOSE, use -p flag |
| Container exits | Application crashes | Check logs, fix application |

## Next Steps

In the next lab, you'll learn how to generate Terraform configurations for provisioning cloud infrastructure for your containerized application.
