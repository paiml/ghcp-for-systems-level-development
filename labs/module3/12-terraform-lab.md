# Lab 12: Terraform Configuration Generation

## Overview

In this lab, you will learn how to use GitHub Copilot to generate Terraform configurations for provisioning cloud infrastructure. You'll create infrastructure as code for deploying the redactr microservice to a cloud provider.

## Setup

Ensure you have:
- GitHub Copilot enabled
- Terraform installed (https://www.terraform.io/downloads)
- Basic understanding of cloud infrastructure concepts
- (Optional) Cloud provider account for testing (AWS, Azure, or GCP)

Install Terraform:
```bash
# macOS
brew install terraform

# Linux
wget https://releases.hashicorp.com/terraform/1.5.0/terraform_1.5.0_linux_amd64.zip
unzip terraform_1.5.0_linux_amd64.zip
sudo mv terraform /usr/local/bin/

# Verify installation
terraform --version
```

## Understanding Terraform

Terraform is an infrastructure as code tool that:
- **Provisions infrastructure**: Creates cloud resources declaratively
- **Manages state**: Tracks infrastructure changes
- **Plans changes**: Shows what will happen before applying
- **Supports multiple providers**: AWS, Azure, GCP, and more

## Tasks

### Task 1: Plan Infrastructure Requirements

1. Determine what infrastructure you need for redactr:
   - Compute instance (VM or container service)
   - Network (VPC, subnets, security groups)
   - Load balancer (optional)
   - Storage (optional, for logs/data)
   - Monitoring (optional)

2. Ask Copilot about requirements:
   ```
   "@workspace What cloud infrastructure is needed to deploy this Rust microservice?"
   ```

3. Document your infrastructure plan

### Task 2: Initialize Terraform Project

1. Create a new directory for Terraform files:
   ```bash
   mkdir terraform
   cd terraform
   ```

2. Create `main.tf` and start with a comment:
   ```terraform
   # Terraform configuration for deploying redactr microservice to AWS
   # Required resources:
   # - EC2 instance or ECS service
   # - Security group for HTTP traffic
   # - VPC and subnet configuration
   ```

3. Let Copilot generate the provider configuration

### Task 3: Configure Provider

1. Add provider configuration (choose AWS, Azure, or GCP) and ask Copilot to
   fill in the rest
   ```terraform
   # Configure the AWS provider
   terraform {
     required_providers {
       # Let Copilot suggest provider configuration
     }
   }

   provider "aws" {
     # Let Copilot suggest provider settings
   }
   ```

2. Use Copilot to complete the provider block

3. Specify the region and other settings

### Task 4: Create Network Resources

Although these steps can be completed with auto-completion, you can use GitHub
Copilot Chat pane to generate them as well.

1. Define VPC and networking:
   ```terraform
   # Create VPC for the application
   resource "aws_vpc" "redactr_vpc" {
     # Let Copilot suggest VPC configuration
   }

   # Create subnet
   resource "aws_subnet" "redactr_subnet" {
     # Let Copilot suggest subnet configuration
   }

   # Create internet gateway
   resource "aws_internet_gateway" "redactr_igw" {
     # Let Copilot suggest configuration
   }
   ```

2. Review and adjust the generated configurations

3. Add route tables and associations

### Task 5: Create Security Group

1. Define security group for the application
2. Configure rules for:
   - Inbound HTTP (port 8080)
   - Outbound internet access
   - SSH access (for management)

### Task 6: Create Compute Resources

1. Define EC2 instance or container service:

2. Include:
   - AMI (Linux distribution)
   - Instance type
   - Security group association
   - User data for bootstrap

3. Or alternatively, use ECS/Fargate for containers

### Task 7: Add Variables

1. Create `variables.tf` if not already created by Copilot

2. Define variables for:
   - Region
   - Instance type
   - Application port
   - Environment name

3. Set default values appropriately

### Task 8: Define Outputs

1. Create `outputs.tf`:
   ```terraform
   # Output values for easy access to important information
   output "instance_public_ip" {
     # Let Copilot suggest output configuration
   }

   output "application_url" {
     # Let Copilot suggest output configuration
   }
   ```

2. Output useful information:
   - Public IP address
   - Application URL
   - DNS names
   - Resource IDs

### Task 9: Add User Data Script

1. Create a bootstrap script for the instance:
   ```terraform
   # User data to install and run the application
   resource "aws_instance" "redactr_instance" {
     # ... other configuration ...

     user_data = <<-EOF
       #!/bin/bash
       # Let Copilot suggest setup commands
     EOF
   }
   ```

2. Include steps to:
   - Update system packages
   - Install Rust and dependencies
   - Clone and build the application
   - Start the service

### Task 10: Create Terraform Workflow

1. Initialize Terraform:
   ```bash
   terraform init
   ```

2. Format the configuration:
   ```bash
   terraform fmt
   ```

3. Validate the configuration:
   ```bash
   terraform validate
   ```

4. Generate an execution plan:
   ```bash
   terraform plan
   ```

5. Review the plan output (DO NOT APPLY unless you want to create real resources)

### Task 11: Add Backend Configuration

1. Configure remote state storage:
   ```terraform
   # Backend configuration for state management
   terraform {
     backend "s3" {
       # Let Copilot suggest S3 backend configuration
     }
   }
   ```

2. Consider using:
   - S3 + DynamoDB (AWS)
   - Azure Storage (Azure)
   - GCS (Google Cloud)
   - Terraform Cloud

### Task 12: Create Environment-Specific Configs

1. Create `dev.tfvars`:
   ```terraform
   # Development environment variables
   instance_type = "t2.micro"
   environment   = "dev"
   ```

2. Create `prod.tfvars`:
   ```terraform
   # Production environment variables
   instance_type = "t2.medium"
   environment   = "prod"
   ```

3. Use with: `terraform plan -var-file="dev.tfvars"`

## Expected Outcomes

By the end of this lab, you should have:
- Complete Terraform configuration for infrastructure
- Variables for customization
- Outputs for important resource information
- Validated, well-formatted configuration
- Understanding of Terraform workflow

## Deliverables

Your Terraform project should include:

1. **main.tf**: Primary resource definitions
2. **variables.tf**: Input variable definitions
3. **outputs.tf**: Output value definitions
4. **terraform.tfvars** (optional): Default values
5. **dev.tfvars / prod.tfvars**: Environment-specific values
6. **README.md**: Usage documentation

## Terraform Best Practices

### Organization
- [ ] Separate files by purpose (main, variables, outputs)
- [ ] Use modules for reusable components
- [ ] Keep environment configs separate
- [ ] Use consistent naming conventions

### Security
- [ ] Never commit credentials or secrets
- [ ] Use minimal IAM permissions
- [ ] Enable encryption at rest
- [ ] Use security groups restrictively
- [ ] Store state securely with encryption

### Maintainability
- [ ] Use variables for values that change
- [ ] Add descriptions to all variables
- [ ] Include helpful outputs
- [ ] Comment complex logic
- [ ] Version pin providers

## Terraform Workflow

```
┌─────────────┐
│ Write Code  │
└──────┬──────┘
       │
┌──────▼──────┐
│ terraform   │
│    init     │
└──────┬──────┘
       │
┌──────▼──────┐
│ terraform   │
│   validate  │
└──────┬──────┘
       │
┌──────▼──────┐
│ terraform   │
│    plan     │
└──────┬──────┘
       │
┌──────▼──────┐
│  Review     │
│   Changes   │
└──────┬──────┘
       │
┌──────▼──────┐
│ terraform   │
│    apply    │ (Only if deploying)
└─────────────┘
```

## Resource Estimation

Estimate costs before applying:

| Resource | Type | Estimated Cost/Month |
|----------|------|---------------------|
| EC2 Instance | t2.micro | ~$8.50 |
| VPC | N/A | Free (data transfer costs apply) |
| EBS Volume | 8 GB | ~$0.80 |
| Data Transfer | Varies | Depends on usage |
| **Total** | | **~$10-15/month** |

## Reflection Questions

1. How did Copilot help with Terraform syntax?
2. What resources did you include and why?
3. How would you modify this for production use?
4. What security improvements are needed?
5. How would you handle secrets and sensitive data?

## Testing Checklist

- [ ] `terraform init` succeeds
- [ ] `terraform validate` passes
- [ ] `terraform fmt` shows proper formatting
- [ ] `terraform plan` shows expected resources
- [ ] Variables have sensible defaults
- [ ] Outputs provide useful information
- [ ] Security groups follow least privilege
- [ ] Costs are within acceptable range

## Advanced Exercise

If time permits:

1. **Modules**: Create reusable Terraform modules
   ```terraform
   module "redactr_deployment" {
     source = "./modules/redactr"
     # ...
   }
   ```

2. **Multi-Region**: Deploy to multiple regions

3. **Auto-Scaling**: Add auto-scaling group configuration

4. **Load Balancer**: Add ALB/NLB for high availability

5. **Monitoring**: Integrate CloudWatch or equivalent

6. **CI/CD**: Create GitHub Actions workflow for Terraform

## Common Terraform Commands

```bash
# Initialize project
terraform init

# Format code
terraform fmt

# Validate configuration
terraform validate

# Plan changes
terraform plan

# Plan with variables
terraform plan -var-file="dev.tfvars"

# Apply changes (creates resources - costs money!)
terraform apply

# Destroy infrastructure (removes resources)
terraform destroy

# Show current state
terraform show

# List resources
terraform state list
```

## Safety Tips

⚠️ **Important**: Be careful when running `terraform apply` or `terraform destroy` with real cloud credentials:

1. **Costs**: Creating resources costs money
2. **Review**: Always review the plan before applying
3. **Testing**: Use the plan command to verify
4. **Cleanup**: Remember to destroy test resources
5. **Credentials**: Never commit credentials to Git

## Documentation Template

Create a `README.md` for your Terraform project:

```markdown
# Redactr Infrastructure

## Overview
[Describe what this Terraform configuration does]

## Prerequisites
- Terraform >= 1.5.0
- AWS CLI configured
- Appropriate IAM permissions

## Usage

\`\`\`bash
# Initialize
terraform init

# Plan
terraform plan -var-file="dev.tfvars"

# Apply (creates resources)
terraform apply -var-file="dev.tfvars"

# Destroy (removes resources)
terraform destroy -var-file="dev.tfvars"
\`\`\`

## Variables

| Name | Description | Default |
|------|-------------|---------|
| region | AWS region | us-east-1 |
| instance_type | EC2 instance type | t2.micro |

## Outputs

| Name | Description |
|------|-------------|
| instance_ip | Public IP of the instance |
| application_url | URL to access the application |
```

## Next Steps

Congratulations! You've completed all three modules of the GitHub Copilot for System Level Development course!

You now know how to:
- Apply TDD with AI assistance
- Navigate and refactor large codebases
- Generate infrastructure as code

Continue practicing these skills on your own projects, and explore more advanced Copilot features as they become available!
