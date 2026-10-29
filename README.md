# LocalStack AWS Testing

### Overview

Testing AWS resources like EC2, and EKS (maybe more in the future) using LocalStack and Terraform, using the `lstk` CLI.

Doing this because I want to learn Terraform and some AWS compute services, but I don't want to pay for them.
I also realized that GitHub and LocalStack partnered to provide a [LocalStack Student plan](https://www.localstack.cloud/localstack-for-students) if you are a student, which I am greatly going to take advantage of...

### How Terraform works (Generally and with LocalStack)

Terraform reads all `.tf` files in the same directory as one configuration.
The folder, filenames, and everything are conventional. The file contents are standard HCL and are not specific to any particular tool.
If this was a real AWS environment, Terraform would provision resources in AWS. With LocalStack and `lstk terraform`,
Terraform instead provisions resources in the LocalStack AWS emulator.

Below is a conventional Terraform project structure, with some notes about what each file does.

```plaintext
terraform/
├── main.tf                 # Connects everything together
├── providers.tf            # Terraform/AWS provider configuration
├── variables.tf            # Inputs for the root configuration
├── outputs.tf              # Values printed after apply
├── environments/
│   ├── localstack.tfvars   # LocalStack-specific values
└── modules/
    ├── ec2/
    │   ├── main.tf         # EC2 resources
    │   ├── variables.tf    # EC2 inputs
    │   └── outputs.tf      # EC2 outputs
    └── eks/
        ├── main.tf         # EKS resources
        ├── variables.tf
        └── outputs.tf
```

What does each type of Terraform file do? Well, technically you could just have one `.tf` file. But, as someone once said, "If you can't read the code, then it's
probably not modular enough." - Einstein, probably. Anyways, here's a breakdown of the files:

- `providers.tf`: How Terraform connects to any provider through their APIs. In this case, the provider is AWS, and `lstk terraform` redirects this connection to LocalStack.
- `variables.tf`: Defines the inputs the configuration accepts. These are schemas/definitions, not the actual values of variables.
- `environments/localstack.tfvars`: Supplies the actual values for Terraform. While `variables.tf` defines the schema, this file provides the actual values for Terraform to use.
- `main.tf`: Connects the root configuration to the modules. It says which modules should be used and passes values into them. This file says "Hey Terraform, use these modules and pass these values from `variables.tf` and `localstack.tfvars` into them."
- `modules/`: Contains the actual resource definitions that we're trying to create/provision/manage. These are the actual resources that are made with Terraform. In this case, it would `aws_instance` or `aws_eks_cluster` on LocalStack.
- `outputs.tf`: Exposes useful values after Terraform creates resources, such as an EC2 instance ID or an EKS cluster endpoint. It does not create resources, but it allows you to see the results of what Terraform created.

The overall flow is:

```text
localstack.tfvars  ->  variables.tf  ->  main.tf  ->  modules/
                                                           |
                                                           v
                                                    LocalStack resources
                                                           |
                                                           v
                                                      outputs.tf
```

`providers.tf` isn't really in the flow because it's the "connection" part between Terraform and a provider (in this case, LocalStack AWS emulator).

### Running Terraform with LocalStack

Start LocalStack first:

```bash
lstk start
```

Then initialize and apply the Terraform configuration:

```bash
cd terraform
lstk terraform init
lstk terraform plan -var-file=environments/localstack.tfvars
lstk terraform apply -var-file=environments/localstack.tfvars
```
