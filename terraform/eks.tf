module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "nginx-cluster"
  cluster_version = "1.25"
  vpc_id          = aws_vpc.main.id
  subnet_ids      = aws_subnet.public[*].id
  
  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_size         = 3
      min_size         = 1
      instance_type    = "t3.medium"
    }
  }
}
