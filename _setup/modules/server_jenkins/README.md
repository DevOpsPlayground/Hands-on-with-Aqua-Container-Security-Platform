# Jenkins Server

## Introduction

Use this module to install Jenkins on an Amazon Linux AMI. 
## Resources Created

### This module

* EC2 Instance

## How to reference

In your terraform script:

```

module "server_jenkins" {
  source = "./modules/jenkins_server"

# VARIABLE DEFINITION

}
```

## Notes


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment\_tag | Value that will be tagged as ENVIRONMENT, on all AWS resources. | string | n/a | yes |
| jenkins\_instance\_count | Number of Jenkins servers to create. | string | n/a | yes |
| jenkins\_instance\_type | EC2 Type of Jenkins instance. | string | `"t2.medium"` | no |
| jenkins\_keypair\_name | Name of keypair in AWS for Jenkins instance. | string | n/a | yes |
| jenkins\_private\_ssh\_key | Name of private key file that exists locally under ~/.ssh | string | n/a | yes |
| jenkins\_sg\_id | Security group IDs for Jenkins instance. | list | n/a | yes |
| jenkins\_ssh\_user | Name of user that can ssh into Jenkins instance. | string | `"ec2-user"` | no |
| jenkins\_subnet1\_id | Subnet ID of Jenkins instance. | string | n/a | yes |
| jenkins\_volume\_size | Size (Gb) of EBS volume for Jenkins instance. | string | `"10"` | no |
| owner\_tag | Value that will be tagged as OWNER, on all AWS resources. | string | n/a | yes |
| prefix\_tag | Prefix string added to Name tag | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| jenkins\_master\_url | URL of the Jenkins Master instance |