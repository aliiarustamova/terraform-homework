resource "aws_instance" "web" {
  ami           = "ami-03f8acd418785369b"
  instance_type = "t2.micro"
  subnet_id = "subnet-0d993eb4ddbf2393a"
  key_name = aws_key_pair.bastion_key.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")
  count = 3

  tags = {
    Name = "web-${count.index + 1}"
  }
}

resource "aws_key_pair" "bastion_key" {
  key_name = "Bastion"
  public_key = file("~/.ssh/id_rsa.pub")
}

output web_1_ip {
    value = aws_instance.web[0].public_ip
}
output web_2_ip {
    value = aws_instance.web[1].public_ip
}
output web_3_ip {
    value = aws_instance.web[2].public_ip
}