resource "aws_route53_record" "component" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "${var.env}-rabbitmq.${var.domain}"
  type    = "A"
  ttl     = 30
  records = [aws_spot_instance_request.rabbitmq.private_ip]
}

