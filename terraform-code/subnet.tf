resource "aws_subnet" "project00-public-subnet" {

  depends_on = [aws_vpc.project00-eks-vpc]

  count = length(var.aws_vpc_public_subnets)
  vpc_id = aws_vpc.project00-eks-vpc.id
  cidr_block = var.aws_vpc_public_subnets[count.index]
  availability_zone = var.aws_azs[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name                                     = "project00-public-subnet${count.index+1}"
    "kubernetes.io/cluster/project00-eks-cluster" = "shared"
    "kubernetes.io/role/elb"                 = 1
  }

}
resource "aws_subnet" "project00-private-subnet" {

  depends_on = [
    aws_vpc.project00-eks-vpc
  ]

  count = length(var.aws_vpc_private_subnets)
  vpc_id = aws_vpc.project00-eks-vpc.id
  cidr_block = var.aws_vpc_private_subnets[count.index]
  availability_zone = var.aws_azs[count.index]

  tags = {
    Name                                          = "project00-private-subnet${count.index+1}"
    "kubernetes.io/cluster/project00-eks-cluster" = "shared"
    "kubernetes.io/role/internal-elb"             = 1
  }

}