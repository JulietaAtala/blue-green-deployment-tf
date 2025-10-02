resource "aws_launch_template" "blue_template" {
  name_prefix   = "${var.project_prefix}-blue"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = var.ec2_instance_type

  network_interfaces {
    delete_on_termination = true
    security_groups       = [data.aws_security_group.ssh.id, data.aws_security_group.http.id]
  }

  user_data = base64encode(templatefile("start-blue.sh", { blue_weight = var.blue_weight }))

  tags = local.common_tags
}

resource "aws_launch_template" "green_template" {
  name_prefix   = "${var.project_prefix}-green"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = var.ec2_instance_type

  network_interfaces {
    delete_on_termination = true
    security_groups       = [data.aws_security_group.ssh.id, data.aws_security_group.http.id]
  }

  user_data = base64encode(templatefile("start-green.sh", { green_weight = var.green_weight }))

  tags = local.common_tags
}

