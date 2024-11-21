provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = var.s3_bucket
    key    = "terraform/statefile.tfstate"
    region = var.aws_region
    encrypt = true
  }
}
