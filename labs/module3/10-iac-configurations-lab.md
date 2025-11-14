# Lab 10: Generating IaC Configurations

## Overview

In this lab, you will learn how to use GitHub Copilot to generate Infrastructure as Code (IaC) configurations for deploying applications. You'll focus on creating deployment automation using modern DevOps tools.

## Setup

For this lab, you'll work with the **redactr** Rust microservice:

```bash
git clone https://github.com/alfredodeza/redactr.git
cd redactr
```

Ensure you have:
- GitHub Copilot enabled
- Basic understanding of deployment concepts
- A text editor for writing configuration files
- Access to review the redactr README to understand the application

## Understanding Infrastructure as Code

IaC allows you to:
- **Define infrastructure in code**: Version-controlled, reviewable
- **Automate deployments**: Consistent, repeatable processes
- **Reduce manual errors**: Less human intervention
- **Enable scaling**: Replicate environments easily

Common IaC tools:
- **Ansible**: Configuration management and deployment
- **Terraform**: Infrastructure provisioning
- **Docker/Kubernetes**: Container orchestration
- **CloudFormation/ARM**: Cloud-specific tools

## Tasks

### Task 1: Understand the Application

1. Ask Copilot to read the redactr project to understand:
   - What the application does
   - What dependencies it has
   - How to build and run it
   - What configuration it needs

2. Ask Copilot about deployment requirements:
   ```
   "@workspace What are the deployment requirements for this Rust microservice?"
   ```

3. Document:
   - Runtime requirements (Rust, system libraries)
   - Build process (cargo build)
   - Configuration needs (environment variables, config files)
   - Network requirements (HTTP port)

### Task 2: Create Deployment Prompt

1. Write a detailed prompt for generating an Ansible playbook:
   ```
   "Generate a deployment procedure for this Rust HTTP microservice application.
   I want to use Ansible for deployment automation.
   Since the deployment process doesn't exist yet, only focus on deploying this on a single Linux server.
   Create a single Ansible playbook file if possible and keep things as simple as possible while being effective.

   The playbook should:
   - Install required packages (Rust, Git, build tools)
   - Clone the repository
   - Build the Rust binary
   - Set up a systemd service
   - Start and enable the service"
   ```

2. Use Copilot Chat or inline suggestions to generate the playbook

3. Save the output to review

### Task 3: Review Generated Configuration

1. Examine the generated Ansible playbook
2. Look for:
   - Proper task structure
   - Logical ordering of operations
   - Error handling
   - Idempotency (can run multiple times safely)

3. Verify it includes:
   - Package installation
   - Repository cloning
   - Binary building
   - Service configuration
   - Service management

### Task 4: Refine the Configuration

1. Identify improvements needed:
   - Add variables for flexibility
   - Improve error handling
   - Add verification steps
   - Include logging

2. Ask Copilot for refinements:
   ```
   "Add variables for the repository URL and install directory"
   "Add a task to verify the service is running after start"
   "Include error handling for build failures"
   ```

3. Apply the improvements

### Task 5: Add Configuration Management

1. Create an Ansible variables file:
   ```
   "Create an Ansible variables file for the redactr deployment with:
   - app_name
   - repo_url
   - install_dir
   - service_user
   - http_port"
   ```

2. Update the playbook to use variables instead of hardcoded values

3. Use Copilot to help with the refactoring

### Task 6: Create Service Template

1. Generate a systemd service file template:
   ```
   "Create a systemd service file template for running the redactr Rust binary:
   - Run as a specific user
   - Auto-restart on failure
   - Capture logs to journald
   - Set working directory"
   ```

2. Save as `templates/redactr.service.j2`

3. Update the Ansible playbook to use the template

### Task 7: Add Health Checks

1. Add a task to verify the service is healthy:
   ```
   "Add an Ansible task that checks if the HTTP service is responding on port 8080"
   ```

2. Include a retry mechanism for startup delays

3. Add a notification task for deployment success/failure

### Task 8: Document the Deployment

1. Create a deployment README:
   ```
   "Create a README for this Ansible deployment that explains:
   - Prerequisites
   - How to run the playbook
   - Configuration options
   - Troubleshooting steps"
   ```

2. Include example commands:
   ```bash
   # Deploy to a server
   ansible-playbook -i inventory.ini deploy.yml

   # Deploy with custom variables
   ansible-playbook -i inventory.ini deploy.yml -e "http_port=3000"
   ```

## Expected Outcomes

By the end of this lab, you should have:
- A complete Ansible playbook for deploying redactr
- Configuration variables for flexibility
- Systemd service configuration
- Health check validation
- Deployment documentation

## Deliverables

Your deployment automation should include:

1. **deploy.yml**: Main Ansible playbook
2. **variables.yml**: Configuration variables
3. **templates/redactr.service.j2**: Systemd service template
4. **inventory.ini**: Example inventory file
5. **README.md**: Deployment instructions

## Best Practices for IaC

1. **Keep It Simple**: Start with basics, add complexity as needed
2. **Use Variables**: Make configurations reusable
3. **Idempotent Operations**: Safe to run multiple times
4. **Error Handling**: Check for failures and handle gracefully
5. **Documentation**: Explain what, why, and how
6. **Version Control**: Track all IaC files in Git
7. **Test Safely**: Use test environments before production

## IaC Checklist

- [ ] Configuration is version-controlled
- [ ] Sensitive data is not hardcoded (use vaults/secrets)
- [ ] Tasks are idempotent
- [ ] Error handling is implemented
- [ ] Health checks verify successful deployment
- [ ] Documentation explains usage
- [ ] Variables allow customization
- [ ] Logging captures deployment details

## Reflection Questions

1. How did Copilot help structure the Ansible playbook?
2. What deployment steps did you need to add that Copilot missed?
3. How would you adapt this for different environments (dev, staging, prod)?
4. What security considerations should you add?
5. How would you handle secrets (database passwords, API keys)?

## Common Pitfalls

| Issue | Problem | Solution |
|-------|---------|----------|
| Hardcoded values | Not reusable | Use variables |
| No error handling | Silent failures | Add failure checks |
| Not idempotent | Fails on re-run | Use proper Ansible modules |
| Missing dependencies | Deployment fails | Document all requirements |
| No rollback | Can't undo | Add rollback playbook |

## Advanced Exercise

If time permits:

1. **Multi-Server Deployment**: Adapt for deploying to multiple servers
2. **Blue-Green Deployment**: Implement zero-downtime deployment
3. **Configuration Secrets**: Use Ansible Vault for sensitive data
4. **Monitoring Integration**: Add tasks to configure monitoring
5. **Rollback Playbook**: Create a playbook to rollback deployments

## Testing Your Deployment

While we won't deploy to real servers in this lab, consider:

1. **Syntax Check**:
   ```bash
   ansible-playbook deploy.yml --syntax-check
   ```

2. **Dry Run**:
   ```bash
   ansible-playbook deploy.yml --check
   ```

3. **Local Testing**: Use Vagrant or Docker to test locally

## Next Steps

In the next lab, you'll learn how to use GitHub Copilot to create Docker configurations for containerizing the redactr microservice.
