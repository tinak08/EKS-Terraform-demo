resource "aws_instance" "web" {
  ami                         = "ami-08df646e18b182346"
  instance_type               = "t2.micro"
  key_name                    = "awsdemo"
  subnet_id                   = aws_subnet.public_sub[count.index].id
  vpc_security_group_ids      = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true
  count                       = 2

  tags = {
    Name = "WebServer"
  }

}

#Create a Database server

resource "aws_instance" "db" {
  ami                    = "ami-08df646e18b182346"
  instance_type          = "t2.micro"
  key_name               = "awsdemo"
  subnet_id              = aws_subnet.private_sub.id
  vpc_security_group_ids = [aws_security_group.allow_tls_db.id]

  tags = {
    Name = "DB Server"
  }
}