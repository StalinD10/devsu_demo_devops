resource "aws_vpc" "main" {
  cidr_block =  var.vpc_cdir

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "VPC_EKS"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "EKS_igw"
  }
}