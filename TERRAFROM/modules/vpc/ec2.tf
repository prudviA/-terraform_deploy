resource "aws_instance" "web_server" {
  ami                    = "ami-05c179eced2eb9b5b"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.ec2-sg.id]
  associate_public_ip_address = true
    tags = {
    Name = "web_server"
  }
}
