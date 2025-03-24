output "vpc_id" {
  value = aws_vpc.terraform_vpc.id
  description = "The ID of the created VPC."
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
  description = "The ID of the public subnet."
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
  description = "The ID of the private subnet."
}

output "ec2_public_ip" {
  value = aws_instance.web_server.public_ip
  description = "The public IP address of the EC2 instance."
}

output "rds_endpoint" {
  value = aws_db_instance.rds-instance.endpoint
  description = "The endpoint of the RDS instance."
}
