provider "aws" {
  region = "eu-west-1"
  shared_credentials_file = "/home/ubuntu/.aws.credentials"
}

module "vpc" {
  source = "./VPC"
}

module "sg_node" {
  web_sg_name = "sg for vpc"
  source = "./SG"
  open_internet = "0.0.0.0/0"
  vpc_id = module.vpc.vpc_id
  ingress_ports = 22
}

module "EC2_node" {
  source = "./EC2"
  name = "ec2"
  subnet_id = module.vpc.subnet_a.id
  vpc_security_group_ids      = [mpdule.web_sg.subnet_id]
}

resource "aws_db_subnet_group" "default" {
  name = "main"
  subnet_ids = [aws_subnet.cidr_block_2, aws_subnet.cidr_block_3]

  tags = {
    Name = "DB privaten subnets"
  }
}


resource "aws_db_instance" "production" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "admin"
  password             = "Password1234!"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot = "true"
}

resource "aws_db_instance" "test" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "admin"
  password             = "Password1234!"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot = "true"
}






}
