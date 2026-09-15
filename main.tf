#All the resources-id to store in SSM Parameter

resource "aws_vpc" "customVPC" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "customIGW" {
  vpc_id = aws_vpc.customVPC.id
  tags = {
    Name = "CustomIGW"
  }
}

resource "aws_route_table" "publicRT" {
  vpc_id = aws_vpc.customVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.customIGW.id
  }

  tags = {
    Name = "publicRT"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.customVPC.id
  cidr_block = var.subnet1_cidr
  availability_zone = var.az1
  map_public_ip_on_launch = true

  tags = {
    Name = "Subnet1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.customVPC.id
  cidr_block = var.subnet2_cidr
  availability_zone = var.az1
  map_public_ip_on_launch = false

  tags = {
    Name = "Subnet2"
  }
}

resource "aws_subnet" "subnet3" {
  vpc_id     = aws_vpc.customVPC.id
  cidr_block = var.subnet3_cidr
  availability_zone = var.az2
  map_public_ip_on_launch = true

  tags = {
    Name = "Subnet3"
  }
}

resource "aws_subnet" "subnet4" {
  vpc_id     = aws_vpc.customVPC.id
  cidr_block = var.subnet4_cidr
  availability_zone = var.az2
  map_public_ip_on_launch = false

  tags = {
    Name = "Subnet4"
  }
}

resource "aws_route_table_association" "subnet1Association" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.publicRT.id
}

resource "aws_route_table_association" "subnet3Association" {
  subnet_id      = aws_subnet.subnet3.id
  route_table_id = aws_route_table.publicRT.id
}

resource "aws_security_group" "albSG" {
  name        = var.alb_sg_name
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.customVPC.id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "var.alb_sg_name"
  }
}

resource "aws_security_group" "ec2SG" {
  name        = var.ec2_sg_name
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.customVPC.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "var.alb_sg_name"
  }
}