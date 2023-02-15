resource "aws_instance" "example_web_server" {
ami = "ami-074dc0a6f6c764218"
instance_type = "t2.micro"
subnet_id = aws_subnet.example_public_subnet_a.id
tags = {
Name = "example_web_server"
}
security_groups = [aws_security_group.example_web_security_group.id]
}

resource "aws_security_group" "example_web_security_group" {
  name = "example_web_security_group"
  description = "Allow HTTP traffic"
  vpc_id = aws_vpc.example_vpc.id
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
