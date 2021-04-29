resource "aws_key_pair" "server_pub_key" {
  key_name   = "tf_ssh_key"
  public_key = file("key.pub")
}

# Server2
resource "aws_instance" "server2" {
  ami                    = data.aws_ami.aws-linux.id
  key_name               = aws_key_pair.server_pub_key.id
  count                  = var.number_of_server2
  subnet_id              = module.vpc.private_subnets[1]
  instance_type          = var.server2_instance_type
  vpc_security_group_ids = [aws_security_group.sg_server2.id]

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_type = "gp2"
    volume_size = 8
  }

  tags {
    Name  = "Server2"
    Owner = "Terraform"
  }
}

# Server3
resource "aws_instance" "server3" {
  ami                    = data.aws_ami.aws-linux.id
  key_name               = aws_key_pair.server_pub_key.id
  count                  = var.number_of_server3
  subnet_id              = module.vpc.private_subnets[2]
  instance_type          = var.server3_instance_type
  vpc_security_group_ids = [aws_security_group.sg_server3.id]

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_type = "gp2"
    volume_size = 8
  }

  tags {
    Name  = "Server3"
    Owner = "Terraform"
  }
}