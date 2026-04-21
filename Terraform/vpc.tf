provider "aws" {
  region = var.aws_region
}

data "aws_availability_zones" "available" {}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.7.0"

  name = "eks-vpc"
  cidr = var.vpc_cidr 
   azs = slice(data.aws_availability_zones.available.names, 0, 2)
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets = ["10.0.4.0/24", "10.0.5.0/24"]
  enable_nat_gateway = true
  single_nat_gateway = true
  enable_dns_hostnames = true
  enable_dns_support = true

  map_public_ip_on_launch = true

  tags = {
    "Name"                                = "eks-vpc"
    "kubernetes.io/cluster/demo-alb-cluster" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/role/elb"                                = "1"
    "kubernetes.io/cluster/demo-alb-cluster"         = "shared"
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb"                       = "1"
    "kubernetes.io/cluster/demo-alb-cluster"         = "shared"
  }

}