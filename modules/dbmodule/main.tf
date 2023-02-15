resource "aws_instance" "example_db_server" {
ami = "ami-074dc0a6f6c764218"
instance_type = "t2.micro"
subnet_id = aws_subnet.example_private_subnet_a.id
tags = {
Name = "example_db_server"
}
security_groups = [aws_security_group.example_db_security_group.id]
}


resource "aws_security_group" "example_db_security_group" {
  name = "example_db_security_group"
  description = "Allow traffic from web servers"
  vpc_id = aws_vpc.example_vpc.id
  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_groups = [aws_security_group.example_php_security_group.id]
  }
}
