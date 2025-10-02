project_prefix = "cmtr-m68g13qx"
aws_region     = "us-east-1"


vpc_name            = "cmtr-m68g13qx-vpc"
public_subnet1_name = "cmtr-m68g13qx-public-subnet1"
public_subnet2_name = "cmtr-m68g13qx-public-subnet2"

sg_http_name = "cmtr-m68g13qx-sg-http"
sg_lb_name   = "cmtr-m68g13qx-sg-lb"

ec2_instance_type = "t3.micro"
sg_ssh_name       = "cmtr-m68g13qx-sg-ssh"

blue_weight  = 100
green_weight = 0