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

variable "number_of_server2" {
  default = 1
}

variable "server2_instance_type" {
  default = "t2.micro"
}

variable "number_of_server3" {
  default = 1
}

variable "server3_instance_type" {
  default = "t2.micro"
}