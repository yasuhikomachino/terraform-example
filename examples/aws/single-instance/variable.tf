variable "aws" {
  type = map(string)
  default = {
    profile = "YOUR_PROFILE_NAME"
    region = "ap-northeast-1"
  }
}

variable "instance_ami_id" {
  type = string
  default = "ami-0053d11f74e9e7f52"
}

variable "vpc_cider" {
  type = string
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  type = string
  default = "example-single-instance-vpc"
}

variable "availability_zone_names" {
  type = map(string)
  default = {
    "1a" = "ap-northeast-1a"
    "1c" = "ap-northeast-1c"
    "1d" = "ap-northeast-1d"
  }
}

variable "public_subnet_1a_name" {
  type = string
  default = "public_subnet_1a"
}

variable "igw_name" {
  type = string
  default = "example-single-instance-igw"
}

variable "route_table_name" {
  type = string
  default = "example-single-instance-route-table"
}

variable "cidr_blocks" {
  type = list(string)
  default = [
    "0.0.0.0/0"
  ]
}

variable "sg_name" {
  type = string
  default = "example-single-instance-sg"
}

variable "ssh_port" {
  type = number
  default = 22
}

variable "instance_name" {
  type = string
  default = "example-single-instance-ec2"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "aws_key_name" {
  type = string
  default = "example-single-instance"
}

variable "root_volume_type" {
  type = string
  default = "gp2"
}

variable "root_volume_size" {
  type = number
  default = 100
}
