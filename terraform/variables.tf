variable "aws_region" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_a" {
  description = "CIDR block for Subnet A"
  default     = "10.0.1.0/24"
}

variable "subnet_cidr_b" {
  description = "CIDR block for Subnet B"
  default     = "10.0.2.0/24"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}


variable "instance_type" {
  description = "EC2 instance type for EKS node group"
  default     = "t3.medium"
}

variable "eks_version" {
  description = "Version of EKS"
  default     = "1.25"
}

variable "db_username" {
  description = "RDS database username"
  default     = "admin"
}

variable "db_password" {
  description = "RDS database password"
  sensitive    = true
}

variable "db_instance_class" {
  description = "RDS instance class"
  default     = "db.t3.medium"
}

variable "s3_bucket" {
  description = "S3 bucket for storing Terraform state file"
  default     = "your-unique-tf-state-bucket"
}
