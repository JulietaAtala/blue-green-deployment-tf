variable "project_prefix" {
  description = "Project identifier used for resource naming and tagging."
  type        = string

}

variable "aws_region" {
  description = "AWS region for resource deployment."
  type        = string
}

variable "vpc_name" {
  description = "Name tag of the pre-configured VPC."
  type        = string
}

variable "public_subnet1_name" {
  description = "Name tag of the first public subnet."
  type        = string
}

variable "public_subnet2_name" {
  description = "Name tag of the second public subnet."
  type        = string
}

variable "sg_ssh_name" {
  description = "Name tag of the SSH Security Group."
  type        = string
}

variable "sg_http_name" {
  description = "Name tag of the HTTP instances Security Group."
  type        = string
}

variable "sg_lb_name" {
  description = "Name tag of the Load Balancer Security Group."
  type        = string
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
  type        = string
}