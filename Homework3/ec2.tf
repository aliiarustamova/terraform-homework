resource "aws_instance" "amazon" {
  ami           = "ami-05572e392e80aee89"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public1.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apacheA.sh")

  tags = {
    Name = "amazon/linux"
  }
}

resource "aws_instance" "ubuntu" {
  ami           = "ami-075686beab831bb7f"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public2.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apacheU.sh")

  tags = {
    Name = "ubuntu"
  }
}