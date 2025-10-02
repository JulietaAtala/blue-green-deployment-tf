variable "project_prefix" {
  description = "Project identifier used for resource naming and tagging."
}

variable "aws_region" {
  description = "AWS region for resource deployment."
}

variable "vpc_name" {
  description = "Name tag of the pre-configured VPC."
}

variable "public_subnet1_name" {
  description = "Name tag of the first public subnet."
}

variable "public_subnet2_name" {
  description = "Name tag of the second public subnet."
}

variable "sg_ssh_name" {
  description = "Name tag of the SSH Security Group."
  default     = "cmtr-m68g13qx-sg-ssh"
}

variable "sg_http_name" {
  description = "Name tag of the HTTP instances Security Group."
}

variable "sg_lb_name" {
  description = "Name tag of the Load Balancer Security Group."
}


variable "blue_weight" {
  description = "The traffic weight for the Blue Target Group. Specifies the percentage of traffic routed to the Blue environment."
  type        = number
}

variable "green_weight" {
  description = "The traffic weight for the Green Target Group. Specifies the percentage of traffic routed to the Green environment."
  type        = number
}

variable "ec2_instance_type" {
  description = "Instance type for EC2 instances in the ASGs."
}