data "aws_ssm_parameter" "username" {
  name = "param.${var.env}.rds.USERNAME"
}

data "aws_ssm_parameter" "password" {
  name = "param.${var.env}.rds.PASSWORD"
}

data "aws_ami" "centos8" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}

