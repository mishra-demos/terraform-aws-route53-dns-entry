provider "aws" {
  region = var.aws_region
}

data "aws_route53_zone" "default" {
  name         = var.domain_name
}

resource "aws_route53_record" "web_server" {
  zone_id = "${data.aws_route53_zone.default.zone_id}"
  name    = "${var.subdomain_name}.${var.domain_name}"
  type    = "A"
  ttl     = "5"
  records = ["${var.dns_record}"]
}