resource "aws_security_group" "web_sg" {
  name        = var.web_sg_name
  description = var.web_sg_description
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.inbound_port
    protocol    = "tcp"
    to_port     = var.inbound_port
    cidr_blocks = [var.open_internet]
  }

  egress {
    from_port   = var.outbound_port
    protocol    = "-1"
    to_port     = var.outbound_port
    cidr_blocks = [var.open_internet]
  }
}

