variable "region" {
  default = "us-east-1"
}
variable "vpc_cidr" {
  default = "20.0.0.0/16"
}
variable "public_subnet_cidrs" {
  default = ["20.0.1.0/24", "20.0.2.0/24"]
}
