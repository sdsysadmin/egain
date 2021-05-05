# //////////////////////////////
# VPC
# //////////////////////////////
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "tf_test_vpc"
  cidr = var.vpc_cidr

  azs              = [var.availability_zone.az1, var.availability_zone.az2]
  public_subnets   = [var.dmz_subnet_cidr]
  private_subnets  = [var.private_subnet_cidr]
  database_subnets = [var.database_subnet_cidr.subnet1, var.database_subnet_cidr.subnet2]
  
  enable_nat_gateway = true
  single_nat_gateway = true
}
