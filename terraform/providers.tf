terraform {
  required_providers {
    aws = {
      version = "~> 5.0"

    }
  }

  required_version = "~> 1.11"

}
provider "aws" {
  region = "us-east-1"
  alias  = "virginia"
  default_tags {
    tags = var.tags
  }
}
