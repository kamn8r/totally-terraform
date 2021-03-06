locals {
  ports    = [22, 80, 443]
  protocol = "tcp"
}

resource "aws_security_group" "cpe-sg-tf" {
  name = "cpe-sg-tf"

  dynamic "ingress" {
    for_each = local.ports
    content {
      description = "description ${ingress.key}"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = local.protocol
      cidr_blocks = [var.vpn_ip]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}