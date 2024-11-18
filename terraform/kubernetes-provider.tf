# Configure AWS provider
provider "aws" {
  region = "us-east-1"  # Change to your AWS region
}

# Configure Kubernetes provider to interact with EKS
provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = module.eks.cluster_certificate_authority_data
  token                  = data.aws_eks_cluster_auth.my_cluster.token
}

# Data sources to fetch EKS cluster details
data "aws_eks_cluster" "my_cluster" {
  name = module.eks.cluster_name
}

data "aws_eks_cluster_auth" "my_cluster" {
  name = module.eks.cluster_name
}
