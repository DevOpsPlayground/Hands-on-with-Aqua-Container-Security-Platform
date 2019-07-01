resource "aws_instance" "jenkins_instance" {
  ami                    = "${data.aws_ami.amazon_linux.id}"
  count                  = "${var.jenkins_instance_count}"
  instance_type          = "${var.jenkins_instance_type}"
  subnet_id              = "${var.jenkins_subnet1_id}"
  vpc_security_group_ids = "${var.jenkins_sg_id}"
  key_name               = "${var.jenkins_keypair_name}"

  root_block_device {
    volume_size = "${var.jenkins_volume_size}"  
  }

  connection {
    type        = "ssh"
    user        = "${var.jenkins_ssh_user}"
    private_key = "${file("~/.ssh/${var.jenkins_private_ssh_key}")}"
    host        = "${self.public_ip}"
  }

  provisioner "file" {
    source      = "${path.module}/config/admin_accnt_config.xml"
    destination = "/tmp/admin_accnt_config.xml"
  }

  provisioner "file" {
    source      = "${path.module}/config/jenkins_config.xml"
    destination = "/tmp/jenkins_config.xml"
  }

  provisioner "remote-exec" {
    scripts = [
      "${path.module}/scripts/jenkins.sh",
      "${path.module}/scripts/jenkins_master_config.sh",
      "${path.module}/scripts/jenkins_agent_config.sh",
    ]
}

  tags = {
    Name = "${var.prefix_tag}_JENKINS_${count.index + 1}"
    Owner = "${var.owner_tag}"
    Environment = "${var.environment_tag}"
  }
}

data "aws_ami" "amazon_linux" {
most_recent = true
owners = ["amazon"] # Canonical

  filter {
      name   = "name"
      values = ["amzn2-ami-hvm*x86_64-gp2"]
  }

  filter {
      name   = "virtualization-type"
      values = ["hvm"]
  }

  filter {
    name = "root-device-type"
    values = ["ebs"]
  }
}
