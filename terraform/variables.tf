
variable "virginia_cidr" {
  description = "CIDR block for Virginia"
  type        = string
}

variable "subnets" {
  description = "Subnets for each region"
  type        = list(string)
}

variable "tags" {
  description = "Tags"
  type        = map(string)
}
variable "ingress_cidr" {
  description = "CIDR block for ingress"
  type        = string
}