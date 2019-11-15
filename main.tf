provider "aws" {
  region = var.aws_region
}

data "aws_route53_zone" "default" {
  name         = var.domain_name
}

resource "aws_route53_record" "web_server" {
  zone_id = "${data.aws_route53_zone.default.zone_id}"
  name    = "${var.domain_name}"
  type    = "A"

  alias {
    name                   = var.elb_dns_name
    zone_id                = var.elb_zone_id
    evaluate_target_health = false
  }
}

