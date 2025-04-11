

variable "tags" {
  description = "Tags"
  type        = map(string)
}
variable "vpc_cdir" {
  description = "cdir for VPC"
  type = string
}

variable "env" {
  description = "Environment (prod, dev, staging)"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "zone1" {
  description = "Disponibility zone 1"
  type        = string
}
variable "zone2" {
  description = "Disponibility zone 2"
  type        = string
}

variable "eks_name" {
  description = "Name cluster EKS"
  type        = string
}

variable "eks_version" {
  description = "Version de EKS"
  type        = string
}