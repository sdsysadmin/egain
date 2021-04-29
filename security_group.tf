# //////////////////////////////
# SECURITY GROUP
# //////////////////////////////

# SG for ELB
resource "aws_security_group" "sg_elb" {
  name   = "sg_elb"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    #cidr_blocks = ["0.0.0.0/0"]
    cidr_blocks = ["192.168.1.0/25"]
  }
}

# SG for server2
resource "aws_security_group" "sg_server2" {
  name   = "sg_server2"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port = 8800
    to_port = 8800
    protocol = "tcp"
    cidr_blocks = ["192.168.0.0/25"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# SG for server3
resource "aws_security_group" "sg_server3" {
  name   = "sg_server3"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port = 1433
    to_port = 1433
    protocol = "tcp"
    cidr_blocks = ["192.168.1.0/25"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}