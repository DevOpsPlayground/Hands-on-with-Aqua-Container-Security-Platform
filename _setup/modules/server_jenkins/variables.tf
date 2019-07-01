variable "jenkins_instance_count" {
  description = "Number of Jenkins servers to create."
  type        = "string"
}

variable "jenkins_instance_type" {
  description = "EC2 Type of Jenkins instance."
  type        = "string"
  default     = "t2.medium"
}

variable "jenkins_subnet1_id" {
  description = "Subnet ID of Jenkins instance."
  type        = "string"
}

variable "jenkins_sg_id" {
  description = "Security group IDs for Jenkins instance."
  type        = "list"
}

variable "jenkins_keypair_name" {
  description = "Name of keypair in AWS for Jenkins instance."
  type        = "string"
}

variable "jenkins_volume_size" {
  description = "Size (Gb) of EBS volume for Jenkins instance."
  type        = "string"
  default     = "10"
}

variable "jenkins_ssh_user" {
  description = "Name of user that can ssh into Jenkins instance."
  type        = "string"
  default     = "ec2-user"
}

variable "jenkins_private_ssh_key" {
  description = "Name of private key file that exists locally under ~/.ssh"
  type        = "string"
}

variable "prefix_tag" {
  description = "Prefix string added to Name tag"
  type        = "string"
}

variable "owner_tag" {
  description = "Value that will be tagged as OWNER, on all AWS resources."
  type        = "string"
}

variable "environment_tag" {
  description = "Value that will be tagged as ENVIRONMENT, on all AWS resources."
  type        = "string"
}

