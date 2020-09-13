resource "aws_instance" "of_public" {
  ami = var.instance_ami_id
  instance_type = var.instance_type
  key_name = var.aws_key_name
  subnet_id = aws_subnet.public_1a.id
  vpc_security_group_ids = [
    aws_security_group.example-single-instance.id
  ]
  associate_public_ip_address = "true"
  root_block_device {
    volume_type = var.root_volume_type
    volume_size = "20"
  }
  ebs_block_device {
    device_name = "/dev/sdf"
    volume_type = var.root_volume_type
    volume_size = var.root_volume_size
  }
  tags = {
    Name = var.instance_name
  }
}