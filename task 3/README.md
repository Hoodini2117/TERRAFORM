# Terraform Modular Environment AWS Infrastructure

This project demonstrates a modular approach to provisioning AWS infrastructure using Terraform. It is structured to support multiple environments (`dev`, `prod`, and `test`) while promoting reuse, clarity, and scalability.

---

# Root Structure
```bash
task 3/
|
|----------- modules/ # Reusable Terraform modules
| |---- ec2/ 
| |---- eip/ 
| |---- nat/ 
| |---- s3/ 
| |---- sg/ 
| |---- subnet/ 
| |---- vpc/ 
| |---- igw/
|----------- dev/ # Development environment configuration
| |---- main.tf 
| |---- variables.tf 
| |---- terraform.tfvars 
| |---- backend.tf 
| |---- provider.tf 
| |---- output.tf
| |---- local.tf
|
|----------- prod/ # Production environment
| |---- (same structure as dev/)
|
|----------- test/ # Testing environment
| |----(same structure as dev/)
```
# Module Structure
This is how the structure of every module in the file "module" (ec2, eip, nat, etc.) Looks like: 
```bash
| |-------- ec2 (module name)
| |-- main.tf
| |-- output.tf
| |-- variables.tf
```
# File Structure

The `dev` environment (and also `prod` and `test`) includes the following seven mandatory Terraform configuration files:

## 1. `main.tf`
Declares the actual infrastructure by calling reusable modules (such as VPC, Subnet, EC2, etc.). This file is the blueprint for resource creation and relationships.

## 2. `variables.tf`
Declares all input variables that are used throughout the environment's configuration. It offers flexibility and parameterization.

## 3. `terraform.tfvars`
Assigns literal values to variables declared in `variables.tf`. Each environment (`dev`, `prod`, `test`) will have its own values appropriate for its use.

## 4. `backend.tf`
Defines the remote backend configuration (e.g., S3 for storing state). Enables shared, consistent, and secure Terraform state management.

## 5. `provider.tf`
Configures the cloud provider (AWS here), including provider name, region, and version required to have consistent deployments.

## 6. `output.tf`
Defines and reveals significant output values from the deployment (such as VPC ID, Subnet ID). These outputs may be used by other configurations or for logging purposes.

## 7. `local.tf`
It holds locally scoped values (such as environment name and app name) utilized to minimize duplication and build dynamic resource names and tags.

