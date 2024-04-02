resource "aws_eks_cluster" "project00-eks-cluster" {

    depends_on = [
        aws_iam_role_policy_attachment.project00-eks_iam_cluster_AmazonEKSClusterPolicy,
        aws_iam_role_policy_attachment.project00-eks_iam_cluster_AmazonEKSVPCResourceController
    ]

    name = var.cluster-name
    role_arn = aws_iam_role.project00-eks_iam_cluster.arn
    version = "1.28"

    vpc_config{
        security_group_ids = [aws_security_group.project00-eks_sg_controlplane.id, aws_security_group.project00-eks_sg_nodes.id]
        subnet_ids = flatten([aws_subnet.project00-private-subnet[*].id])
        endpoint_private_access = true
        endpoint_public_access = false
    }

    tags = {
        "Name" = "PROJECT00-EKS-CLUSTER"
    }
}