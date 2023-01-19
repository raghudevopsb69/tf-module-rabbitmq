resource "aws_spot_instance_request" "rabbitmq" {
  ami                    = data.aws_ami.centos8.id
  instance_type          = var.instance_type
  subnet_id              = local.db_subnets_ids[0]
  vpc_security_group_ids = [aws_security_group.allow_rabbitmq.id]
  wait_for_fulfillment   = true
  iam_instance_profile   = aws_iam_instance_profile.ec2-instance-profile.name

  tags = {
    Name = "${var.env}-rabbitmq"
  }

  user_data = base64encode(templatefile("${path.module}/ansible-pull.sh", {
    env = var.env
  }))
}

resource "aws_ec2_tag" "name-tag" {
  resource_id = aws_spot_instance_request.rabbitmq.spot_instance_id
  key         = "Name"
  value       = "${var.env}-rabbitmq"
}
