# //////////////////////////////
# VARIABLES
# //////////////////////////////
variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "region" {
  default = "eu-west-1"
}

variable "elb_number_of_instances" {
  default = 1
}

variable "server2_instance_type" {
  default = "t2.micro"
}

variable "server3_instance_type" {
  default = "t3.xlarge"
}

# AWS AMI ID for Microsoft SQL Server 2019 Standard on Windows Server 2016
variable "server3_ami_id" {
  default = "ami-0529c43552e85a846"
}