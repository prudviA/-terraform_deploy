resource "aws_db_subnet_group" "rds-subnet-group" {
  name       = "rds-subnet-group"
  subnet_ids = [aws_subnet.private_subnet.id]

  tags = {
    Name = "rds-subnet-group"
  }
}
resource "aws_db_instance" "rds-instance" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t2.micro"
  username             = "admin"
  password             = "password"
  db_subnet_group_name = aws_db_subnet_group.rds-subnet-group.name
  vpc_security_group_ids = [aws_security_group.rds-subnet-group]
  skip_final_snapshot  = true
  tags = {
    Name ="rds-instance"
  }
}
