resource "aws_eks_node_group" "user_profile_nodes" {
  cluster_name    = "prod-cluster"
  node_group_name = "user-profile-api-ng"
  node_role_arn   = "arn:aws:iam::123456789012:role/eks-node-role"
  subnet_ids      = ["subnet-012345abcde"] # Solo una subnet en us-east-1a

  instance_types = ["t3.xlarge"]
  disk_size      = 50

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }
}

resource "aws_security_group" "node_sg" {
  name        = "user-profile-node-sg"
  description = "SG for the user profile nodes"
  vpc_id      = "vpc-0abcdef123"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}