resource "aws_eks_cluster" "main" {
  name     = "my-cluster"
  role_arn = aws_iam_role.eks_role.arn  # Correct reference to the eks_role

  vpc_config {
    subnet_ids = var.subnet_ids  # Correct reference to subnet_ids from variables
  }
}

resource "aws_iam_role" "eks_role" {
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "eks.amazonaws.com"
        }
        Effect    = "Allow"
        Sid       = ""
      }
    ]
  })
}

resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.main.name        
  node_group_name = "ng-1"                           
  node_role_arn   = aws_iam_role.node_group_role.arn 
  
  subnet_ids      = var.subnet_ids                   
  instance_types  = [var.instance_type]              
  
  scaling_config {
    desired_size = 2                                 
    min_size     = 1                                 
    max_size     = 3                                 
  }

  depends_on = [
    aws_eks_cluster.main,                            
    aws_iam_role.node_group_role                     
  ]
}


resource "aws_iam_role" "node_group_role" {
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Effect    = "Allow"
        Sid       = ""
      }
    ]
  })
}
