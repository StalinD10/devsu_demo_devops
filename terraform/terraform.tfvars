vpc_cdir= "10.0.0.0/16"

tags = {
  "env"         = "dev"
  "owner"       = "davidDev"
  "cloud"       = "aws"
  "IAC"         = "Terraform"
  "IAC_Version" = "1.11.3"
}

env         = "prod"
region      = "us-east-1"
zone1       = "us-east-1a"
zone2       = "us-east-1b"
eks_name    = "demo"
eks_version = "1.29"