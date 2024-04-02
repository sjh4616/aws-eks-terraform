output "cluster_name" {
  value = aws_eks_cluster.project00-eks-cluster.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.project00-eks-cluster.endpoint
}

output "bastion-publicIP" {
  value = aws_instance.project00-bastion.public_ip
}