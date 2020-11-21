provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "/home/ubuntu/.aws.credentials"
}

module "vpc" {
  source = "./VPC"
}

module "sg_node" {
  web_sg_name   = "sg for vpc"
  source        = "./SG"
  open_internet = "0.0.0.0/0"
  vpc_id        = module.vpc.vpc_id
  ingress_ports = [22, 80, 3306, 8080]
}

module "ec2" {
  source                 = "./EC2"
  name                   = "ec2"
  subnet_id              = module.vpc.subnet_a_id
  vpc_security_group_ids = [module.sg_node.sg_id]
}

module "eks" {
  source      = "./EKS"
  sub1        = module.vpc.subnet_b_id
  sub2        = module.vpc.subnet_c_id
  security_id = module.sg_node.sg_id
}




resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [module.vpc.subnet_b_id, module.vpc.subnet_c_id]

  tags = {
    Name = "DB privaten subnets"
  }
}


resource "aws_db_instance" "production" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  name                   = "mydb"
  username               = "admin"
  password               = "Password1234"
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = "true"
  db_subnet_group_name   = aws_db_subnet_group.default.name
  vpc_security_group_ids = [module.sg_node.sg_id]
}

resource "aws_db_instance" "test" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  name                   = "mydb"
  username               = "admin"
  password               = "Password1234"
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = "true"
  publicly_accessible    = "true"
  db_subnet_group_name   = aws_db_subnet_group.default.name
  vpc_security_group_ids = [module.sg_node.sg_id]
}

