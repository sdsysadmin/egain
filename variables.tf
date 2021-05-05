# //////////////////////////////
# VARIABLES
# //////////////////////////////

# Access info
variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "region" {
  default = "eu-west-1"
}

# VPC variables
variable "vpc_cidr" {
  default = "192.168.0.0/22"
}

variable "dmz_subnet_cidr" {
  default = "192.168.0.0/25"
}

variable "private_subnet_cidr" {
  default = "192.168.1.0/25"
}

variable "database_subnet_cidr" {
  type = map(string)
  default = {
    "subnet1" = "192.168.2.0/25",
    "subnet2" = "192.168.3.0/25"
  }
}

variable "availability_zone" {
  type = map(string)
  default = {
    "az1" = "eu-west-1a",
    "az2" = "eu-west-1b"
  }
}

variable "elb_number_of_instances" {
  default = 1
}

# Server2 variables
variable "server2_instance_type" {
  default = "t2.micro"
}

# Server3 variables
variable "server3_instance_type" {
  default = "t3.xlarge"
}

# AWS AMI ID for Microsoft SQL Server 2019 Standard on Windows Server 2016
variable "server3_ami_id" {
  default = "ami-0529c43552e85a846"
}