
resource "aws_security_group" "ec2-sg" {
  name        = "ec2-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.terraform_vpc.id

  # Ingress Rule: Allow HTTPS (Port 22) for IPv4
  ingress {
    description = "Allow HTTPS traffic for IPv4"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #Allow SSH from anywhere:adjust as needed
  }

  # Egress Rule: Allow all outbound traffic for IPv4
  egress {
    description = "Allow all outbound traffic for IPv4"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "ec2-sg"
  }
}

resource "aws_security_group" "rds-sg" {
  name        = "rds-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.terraform_vpc.id

 # Ingress Rule: Allow HTTPS (Port 3306) for IPv6
  ingress {
    description = "Allow HTTPS traffic for IPv6"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/0"]
  }

  # Egress Rule: Allow all outbound traffic for IPv6
  egress {
    description      = "Allow all outbound traffic for IPv6"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-sg"
  }
}
