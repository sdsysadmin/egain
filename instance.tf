resource "aws_key_pair" "server_pub_key" {
  key_name   = "tf_ssh_key"
  public_key = file("key.pub")
}

# Server2 - Amazon Linux - Web
module "ec2_instances" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "server2"
  instance_count         = var.elb_number_of_instances

  ami                    = data.aws_ami.aws-linux.id
  instance_type          = var.server2_instance_type
  key_name               = aws_key_pair.server_pub_key.id

  vpc_security_group_ids = [aws_security_group.sg_server2.id]
  subnet_id              = element(module.vpc.private_subnets, 0)

  root_block_device = [
    {
      volume_size = "10"
      volume_type = "gp2"
    },
  ]

  ebs_block_device = [
    {
      device_name           = "/dev/xvdz"
      volume_type           = "gp2"
      volume_size           = "8"
      delete_on_termination = true
    },
  ]

  tags = {
    "Name"  = "Server2"
    "Owner" = "Terraform"
  }
}

# Server3 - Windows Server - MSSQL Database
resource "aws_instance" "server3" {
  ami                    = var.server3_ami_id
  key_name               = aws_key_pair.server_pub_key.id
  subnet_id              = module.vpc.database_subnets[0]
  instance_type          = var.server3_instance_type
  vpc_security_group_ids = [aws_security_group.sg_server3.id]

  ebs_block_device {
      device_name           = "xvdb"
      volume_type           = "gp2"
      volume_size           = 8
      delete_on_termination = true
  }
  tags = {
    "Name"  = "Server3"
    "Owner" = "Terraform"
  }
}