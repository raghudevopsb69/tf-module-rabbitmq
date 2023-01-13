resource "aws_route53_record" "component" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "${var.env}-${var.component}.${var.domain}"
  type    = "CNAME"
  ttl     = 30
  records = [local.dns_name]
}

