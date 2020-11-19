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

