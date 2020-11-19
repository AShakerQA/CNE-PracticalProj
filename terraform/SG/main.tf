resource "aws_security_group" "web_sg" {
  name        = var.web_sg_name
  description = var.web_sg_description
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.ingress_ports
    protocol    = "tcp"
    to_port     = var.ingress_ports
    cidr_blocks = [var.open_internet]
  }

  egress {
    from_port   = var.egress_ports
    protocol    = "-1"
    to_port     = var.egress_ports
    cidr_blocks = [var.open_internet]
  }
}


