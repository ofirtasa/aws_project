provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./vpc"
}

module "eks" {
  source      = "./eks"
  vpc_id      = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
}

module "rds" {
  source       = "./rds"
  vpc_id       = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
}

module "nginx_service" {
  source = "./nginx_service"
  eks_cluster_id = module.eks.cluster_id
  rds_endpoint = module.rds.endpoint
  ssl_cert_path = "./ssl/self_signed.crt"
  ssl_key_path = "./ssl/self_signed.key"
}
