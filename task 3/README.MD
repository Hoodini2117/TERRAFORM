## TERRAFORM TASK 3

Environment Folder: dev/
Contains configuration for the development environment. This is where you define how modules are instantiated and configured for development.

Key Files:

backend.tf: Configures remote state storage (e.g., S3, Terraform Cloud).

local.tf: Defines local variables for internal usage in this environment.

main.tf: Calls the modules and wires them together.

output.tf: Defines which outputs (e.g., public IP, VPC ID) should be displayed.

provider.tf: Configures the cloud provider (e.g., AWS region, credentials).

terraform.tfvars: Supplies actual values for variables (environment-specific).

variable.tf: Declares input variables used in main.tf.

Modules Folder: modules/
Contains reusable Terraform components. Each subfolder represents a separate module for a specific AWS resource.

ec2/
Creates EC2 instances with parameters like AMI, instance type, key pair, subnet, and tags.

eip/ (Elastic IP)
Allocates and optionally associates Elastic IPs, useful for assigning static public IP addresses.

igw/ (Internet Gateway)
Creates an Internet Gateway for the VPC, enabling internet access for public subnets.

nat/
Creates a NAT Gateway to allow instances in private subnets to access the internet securely.

s3/
Provisions S3 buckets, potentially used for logs, state files, or application storage.

sg/ (Security Group)
Manages security groups and rules for controlling inbound and outbound traffic.

subnet/
Creates public or private subnets within a VPC using specified CIDR blocks and availability zones.

vpc/
Provisions the VPC, including its CIDR range and associated metadata. This is the foundational network layer.

Folders: prod/ and test/
Similar to the dev/ folder, these represent configurations for production and testing environments. Each is typically configured with environment-specific variables and settings.

## running the architecture
after creating the modules, we have to run it through the terminal. 
we have to use : terraform init to initialize the terminal
![image](https://github.com/user-attachments/assets/632e41b0-5b57-4489-a20a-9db24c174871)
after wards using terraform plan : Shows what Terraform intends to do. Compares the current state with the desired configuration. Lists resources that will be created, changed, or destroyed.
![image](https://github.com/user-attachments/assets/1d3092e7-ab30-4f10-91d5-86c97854062f)
afterwareds we will use terraform apply. Applies the plan and provisions infrastructure. -auto-approve skips the manual confirmation step.
![image](https://github.com/user-attachments/assets/21dde369-d2be-4cc4-a8e4-4b73f0dc7c27)
