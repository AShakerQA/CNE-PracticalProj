output "ec2_ip" {
  value = module.ec2.public_ip
}

output "rds_endpoint_test" {
  value = aws_db_instance.test.endpoint
}

output "rds_endpoint_prod" {
  value = aws_db_instance.production.endpoint
}
