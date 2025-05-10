Terraform Project: VPC, Subnet, and EC2 Instance Setup
This Terraform project provisions an AWS Virtual Private Cloud (VPC), a subnet, and an EC2 instance using a modular approach. Each resource is managed within its own module (vpc, subnet, and ec2), and variables are defined externally to allow easy customization and reuse.

📁 Project Directory Structure
css
Copy
Edit
```bash
Task2/
│
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── subnet/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── ec2/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── main.tf
├── variables.tf
├── terraform.tfvars
└── outputs.tf
```
## EC2 Module
File	Description
main.tf	Provisions an EC2 instance in the specified subnet with custom parameters
variables.tf	Defines inputs like ami, instance_type, subnet_id, and name
outputs.tf	Outputs the instance ID

## VPC Module
File	Description
main.tf	Creates a VPC using the given CIDR block and name
variables.tf	Declares variables such as cidr_block, name, etc.
outputs.tf	Outputs the created VPC's ID

## Subnet Module
File	Description
main.tf	Creates a subnet in the given VPC with specified CIDR block and availability zone
variables.tf	Declares inputs like vpc_id, cidr_block, and availability_zone
outputs.tf	Outputs the subnet ID

## Root Module Setup
File	Description
main.tf	Instantiates the VPC, subnet, and EC2 modules with appropriate variables
variables.tf	Declares input variables used by all modules
terraform.tfvars	Provides actual values for the declared variables
outputs.tf	Displays outputs such as VPC ID, Subnet ID, EC2 Instance ID, and Public IP


