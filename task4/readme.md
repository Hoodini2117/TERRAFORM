/ DOCUMENTATION

### Terraform Multi-Tier AWS Architecture Documentation
This project automates the deployment of a secure, scalable, and highly available multi-tier application infrastructure on Amazon Web Services (AWS) using Terraform. The architecture is modular, allowing for easy maintenance, extension, and reuse of components.

## Project Objective

The goal is to provision a standard web application stack on AWS consisting of the following components:

A Virtual Private Cloud (VPC) for network isolation

Public and private subnets distributed across multiple Availability Zones (AZs)

Internet and NAT Gateways for controlled internet access

Security Groups to regulate traffic between tiers

Auto Scaling Groups (ASGs) and Launch Templates for frontend and backend servers

Application Load Balancers (ALBs) to distribute traffic

An RDS database deployed in private subnets for improved security

This infrastructure ensures high availability, security, and scalability.

## Project Structure
The project directory is structured into a root module and multiple feature-specific submodules.
```bash
terraform-project/
├── main.tf              # Root module configuration
├── variables.tf         # Input variable declarations
├── outputs.tf           # Output definitions
├── terraform.tfvars     # Variable values
├── providers.tf         # Provider and backend setup
└── modules/
    ├── vpc/             # VPC and subnet configuration
    ├── networking/      # Internet/NAT gateways and route tables
    ├── security/        # Security groups
    ├── compute/         # EC2 instances, ASGs, and launch templates
    ├── alb/             # Application Load Balancers
    └── rds/             # Relational Database Service
Each module includes its own main.tf, variables.tf, and outputs.tf files.
```

## Module Descriptions
### VPC Module
Provisions a VPC with a defined CIDR block

Creates public subnets for frontend, private subnets for backend and database layers across all specified AZs

Outputs VPC and subnet IDs for use by other modules

### Networking Module
Attaches an Internet Gateway to the VPC

Allocates Elastic IPs and deploys NAT Gateways in public subnets

Configures route tables for public and private subnets and associates them accordingly

Outputs gateway and route table IDs

### Security Module
Creates distinct security groups for web, application, and database layers:

Web: allows HTTP/HTTPS from any source

App: allows traffic from the web security group

Database: allows traffic from the app security group

Outputs security group IDs

### Compute Module
Defines Launch Templates for web and application EC2 instances

Configures Auto Scaling Groups for both tiers in appropriate subnets

Creates target groups for ALB integration

Outputs target group ARNs

### ALB Module
Creates a public ALB for the web tier and a private ALB for the app tier

Sets up HTTP and HTTPS listeners (requires an SSL certificate for HTTPS)

Associates target groups with respective listeners

Outputs DNS names and ARNs for the ALBs

### RDS Module
Creates a subnet group for the RDS instance

Provisions an RDS instance in private subnets

Configures the database engine, version, storage, and credentials

Outputs the database endpoint and username

### Configuration Files
main.tf
Invokes all modules in the required order

Passes outputs from one module as inputs to others

Manages interdependencies, such as VPC and subnet references

variables.tf
Declares all configurable input variables

Provides defaults for common values such as region, CIDR blocks, instance types, etc.

Handles sensitive variables like database passwords

outputs.tf
Defines outputs such as ALB DNS names and RDS endpoints

Marks sensitive outputs for protection in logs

terraform.tfvars
Sets specific values for variables

Can include sensitive data but should be used cautiously in production

providers.tf
Configures the AWS provider and Terraform version constraints

Can include remote backend configuration for state management

### Usage Instructions
Initialize Terraform
Run the following to download the necessary providers and modules:

terraform init
Configure Variables
Update terraform.tfvars with your deployment-specific values.
For secrets, use environment variables:


export TF_VAR_db_password="your-secure-password"
Plan the Infrastructure
Review the execution plan:

nginx
terraform plan
Apply the Configuration
Apply the changes to create the infrastructure:

nginx
Copy
Edit
terraform apply
Review Outputs
After the apply step, outputs such as ALB DNS names and the RDS endpoint will be displayed. Sensitive values will be masked.

Best Practices
Modularity: Use clearly defined modules to isolate functionality and promote reuse.

Sensitive Data: Use environment variables or a secrets manager for credentials and sensitive variables.

State Management: Store state remotely and securely, such as in an S3 bucket with DynamoDB for locking.

Security: Isolate database subnets and enforce strict access controls via security groups.

Resource Tagging: Tag all resources consistently for tracking, cost management, and compliance.

Example Outputs
ini
Copy
Edit
web_alb_dns_name = "web-alb-1234567890.us-east-1.elb.amazonaws.com"
app_alb_dns_name = "app-alb-1234567890.us-east-1.elb.amazonaws.com"
rds_endpoint     = "mydb.123456789012.us-east-1.rds.amazonaws.com"
Troubleshooting
Missing Variables: Ensure all variables are defined in variables.tf and values are provided in terraform.tfvars or environment variables.

Module Errors: Verify required inputs are correctly passed between modules.

Provider Errors: Confirm that your AWS credentials and region configuration are correct.

## Conclusion
This Terraform-based infrastructure provides a robust foundation for deploying multi-tier applications on AWS. With its modular design and best practice configurations, it supports secure, scalable, and easily manageable environments for modern cloud applications.


![Screenshot 2025-05-27 170441](https://github.com/user-attachments/assets/321d98ef-b51d-450a-9d30-22daab22624e)


![Screenshot 2025-05-27 170511](https://github.com/user-attachments/assets/99fa2a01-5396-458b-bfb8-803437570645)


![Screenshot 2025-05-27 171901](https://github.com/user-attachments/assets/c693a7e9-d685-4494-b3ea-99c9ff6ef5db)
