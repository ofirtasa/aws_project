module "vpc" {
  source = "./vpc.tf"
}

module "eks" {
  source      = "./eks.tf"
  vpc_id      = module.vpc.vpc_id
  subnet_ids  = module.vpc.subnet_ids
}

module "rds" {
  source        = "./rds.tf"
  db_username   = var.db_username
  db_password   = var.db_password
  db_instance_class = var.db_instance_class
}

module "ingress" {
  source   = "./ingress.tf"
  eks_cluster_name = module.eks.cluster_name
}

module "secrets" {
  source    = "./secrets.tf"
  db_password = var.db_password
}
