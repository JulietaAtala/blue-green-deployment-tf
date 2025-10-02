data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-kernel-6.1-x86_64"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

data "aws_subnet" "public1" {
  vpc_id = data.aws_vpc.selected.id
  filter {
    name   = "tag:Name"
    values = [var.public_subnet1_name]
  }
}

data "aws_subnet" "public2" {
  vpc_id = data.aws_vpc.selected.id
  filter {
    name   = "tag:Name"
    values = [var.public_subnet2_name]
  }
}

data "aws_security_group" "ssh" {
  vpc_id = data.aws_vpc.selected.id
  filter {
    name   = "tag:Name"
    values = [var.sg_ssh_name]
  }
}

data "aws_security_group" "http" {
  vpc_id = data.aws_vpc.selected.id
  filter {
    name   = "tag:Name"
    values = [var.sg_http_name]
  }
}

data "aws_security_group" "lb" {
  vpc_id = data.aws_vpc.selected.id
  filter {
    name   = "tag:Name"
    values = [var.sg_lb_name]
  }
}

locals {
  public_subnet_ids = [data.aws_subnet.public1.id, data.aws_subnet.public2.id]

  common_tags = {
    Terraform = "true"
    Project   = var.project_prefix
  }
}