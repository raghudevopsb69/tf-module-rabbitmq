resource "aws_security_group" "allow_rabbitmq" {
  name        = "${var.env}_allow_rabbitmq"
  description = "Allow RabbitMQ Access"
  vpc_id      = local.vpc_id

  ingress {
    description = "rabbitmq"
    from_port   = 5672
    to_port     = 5672
    protocol    = "tcp"
    cidr_blocks = local.app_subnets_cidr
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.env}_allow_rabbitmq"
  }
}


