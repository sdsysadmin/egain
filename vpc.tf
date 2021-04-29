# //////////////////////////////
# VPC
# //////////////////////////////
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "tf_test_vpc"
  cidr = "192.168.0.0/22"

  azs             = ["eu-west-1a"]
  public_subnets  = ["192.168.0.0/25"]
  private_subnets = ["192.168.1.0/25","192.168.2.0/25"]
  
  enable_nat_gateway = true
  single_nat_gateway = true
}