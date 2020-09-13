resource "aws_vpc" "example-single-instance" {
  cidr_block = var.vpc_cider
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public_1a" {
  cidr_block = "10.0.0.0/24"
  vpc_id = aws_vpc.example-single-instance.id
  availability_zone = var.availability_zone_names["1a"]
  map_public_ip_on_launch = true
  tags = {
    Name = var.public_subnet_1a_name
  }
  timeouts {
    delete = "5m"
  }
}

resource "aws_internet_gateway" "public" {
  vpc_id = aws_vpc.example-single-instance.id
  tags = {
    Name = var.igw_name
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.example-single-instance.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public.id
  }
  tags = {
    Name = var.route_table_name
  }
}

resource "aws_route_table_association" "public_1a" {
  route_table_id = aws_route_table.public.id
  subnet_id = aws_subnet.public_1a.id
}

resource "aws_security_group" "example-single-instance" {
  name = var.sg_name
  vpc_id = aws_vpc.example-single-instance.id
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = var.cidr_blocks
  }
  tags = {
    Name = var.sg_name
  }
}

resource "aws_security_group_rule" "allow_ssh" {
  type = "ingress"
  from_port = var.ssh_port
  protocol = "tcp"
  security_group_id = aws_security_group.example-single-instance.id
  to_port = var.ssh_port
  cidr_blocks = var.cidr_blocks
}