resource "aws_eks_node_group" "project00-eks-nodegroup" {

    cluster_name = aws_eks_cluster.project00-eks-cluster.name
    node_group_name = "project00-eks-nodegroup"
    node_role_arn = aws_iam_role.project00-eks_iam_nodes.arn
    subnet_ids = aws_subnet.project00-private-subnet[*].id

    ami_type = "AL2_x86_64"
    capacity_type = "ON_DEMAND"
    instance_types = ["t3a.medium"]
    disk_size = 20

    scaling_config {
      desired_size = 2
      max_size = 3
      min_size = 1
    }

    remote_access {
      source_security_group_ids = [aws_security_group.project00-bastion-sg.id]
      ec2_ssh_key               = "project00-key"
    }

    depends_on = [
        aws_iam_role_policy_attachment.project00-eks_iam_cluster_AmazonEKSWorkerNodePolicy,
        aws_iam_role_policy_attachment.project00-eks_iam_cluster_AmazonEKS_CNI_Policy,
        aws_iam_role_policy_attachment.project00-eks_iam_cluster_AmazonEC2ContainerRegistryReadOnly
    ]

    tags = {
      "Name" = "Project00-EKS-WORKER-NODES"
    }
}
