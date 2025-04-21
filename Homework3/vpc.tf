resource "aws_vpc" "kaizen" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.kaizen.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.kaizen.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public2"
  }
}

resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.kaizen.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-west-2c"
  map_public_ip_on_launch = true

  tags = {
    Name = "private1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.kaizen.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-west-2d"
  map_public_ip_on_launch = true

  tags = {
    Name = "private2"
  }
}

resource "aws_internet_gateway" "homework3_igw" {
  vpc_id = aws_vpc.kaizen.id

  tags = {
    Name = "homework3_igw"
  }
}


resource "aws_route_table" "public" {
  vpc_id = aws_vpc.kaizen.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.homework3_igw.id
  }

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.kaizen.id
  tags = {
    Name = "private-rt"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private.id
}