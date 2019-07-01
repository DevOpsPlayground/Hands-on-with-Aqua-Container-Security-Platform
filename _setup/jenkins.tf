terraform {
  required_version = ">= 0.12.0"
}

provider "aws" {
  region = "${var.aws_region}"
}

# Create a basic network for the environment. VPC, Subnet, Security groups, IGW etc
module "aws_basic_network" {
  source = "./modules/aws_basic_network"
  
  aws_core_vpc_cidr = "${var.vpc_cidr}"
  aws_core_subnet_cidr1 = "${var.subnet_cidr}"
  aws_core_az_1 = "${var.aws_availability_zone}"
  additional_public_cidrs = "${var.additional_cidrs}"

  owner_tag = "${var.own_tag}"
  environment_tag = "${var.env_tag}"
  prefix_tag = "${var.pre_tag}"
}

module "aws_key_pair" {
  source = "./modules/aws_key_pair"

  aws_core_public_key_file = "${var.pub_key_file}"
  aws_core_public_key_name = "${var.pub_key_name}"
}

module "server_jenkins" {
  source = "./modules/server_jenkins"
  
  jenkins_instance_count = "${var.jenkins_count}"
  jenkins_keypair_name = "${var.pub_key_name}"
  jenkins_private_ssh_key = "${var.private_key_file}"
  jenkins_sg_id = ["${module.aws_basic_network.aws_default_sg_id}"]
  jenkins_subnet1_id = "${module.aws_basic_network.aws_subnet_id}"
  owner_tag = "${var.own_tag}"
  prefix_tag = "${var.pre_tag}"
  environment_tag = "${var.env_tag}"
}


output "jenkins_master_url" {
  description = "URL(s) of the Jenkins Master instance"
  value       = "${module.server_jenkins.jenkins_master_url}"
}