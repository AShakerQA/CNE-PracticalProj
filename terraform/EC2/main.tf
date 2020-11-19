resource "aws_instance" "exampleinstance" {
  ami = var.ami_id
  instance_type = var.instance
  key_name = var.key_name
  subnet_id = var.subnet_id
  vpc_security_groups_id = var.vpc_security_group_ids
  tags = {
    name = var.name
  }
  associate_public_id_address = var.enable_public_ip
}

