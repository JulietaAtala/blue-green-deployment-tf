variable "project_prefix" {
  description = "Project identifier used for resource naming and tagging."
  default     = "cmtr-m68g13qx"
}

variable "aws_region" {
  description = "AWS region for resource deployment."
  default     = "us-east-1"
}

variable "vpc_name" {
  description = "Name tag of the pre-configured VPC."
  default     = "cmtr-m68g13qx-vpc"
}

variable "public_subnet1_name" {
  description = "Name tag of the first public subnet."
  default     = "cmtr-m68g13qx-public-subnet1"
}

variable "public_subnet2_name" {
  description = "Name tag of the second public subnet."
  default     = "cmtr-m68g13qx-public-subnet2"
}

variable "sg_ssh_name" {
  description = "Name tag of the SSH Security Group."
  default     = "cmtr-m68g13qx-sg-ssh"
}

variable "sg_http_name" {
  description = "Name tag of the HTTP instances Security Group."
  default     = "cmtr-m68g13qx-sg-http"
}

variable "sg_lb_name" {
  description = "Name tag of the Load Balancer Security Group."
  default     = "cmtr-m68g13qx-sg-lb"
}


variable "blue_weight" {
  description = "The traffic weight for the Blue Target Group. Specifies the percentage of traffic routed to the Blue environment."
  type        = number
  default     = 100
}

variable "green_weight" {
  description = "The traffic weight for the Green Target Group. Specifies the percentage of traffic routed to the Green environment."
  type        = number
  default     = 0
}

variable "ec2_instance_type" {
  description = "Instance type for EC2 instances in the ASGs."
  default     = "t3.micro"
}