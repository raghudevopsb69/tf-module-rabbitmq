resource "aws_spot_instance_request" "rabbitmq" {
  ami           = data.aws_ami.centos8.id
  instance_type = var.instance_type

  tags = {
    Name = "${var.env}-rabbitmq"
  }

  user_data = <<EOF
#!/bin/bash
labauto ansible
ansible-pull -i localhost, -U https://github.com/raghudevopsb69/roboshop-ansible roboshop.yml -e ROLE_NAME=rabbitmq -e ENV=${var.env}
EOF
}

resource "aws_ec2_tag" "name-tag" {
  resource_id = aws_spot_instance_request.rabbitmq.spot_instance_id
  key         = "Name"
  value       = "${var.env}-rabbitmq"
}
