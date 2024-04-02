resource "aws_internet_gateway" "project00-internet-gateway" {

  depends_on = [
    aws_vpc.project00-eks-vpc
  ]

  vpc_id = aws_vpc.project00-eks-vpc.id

  tags = {
    Name = "${var.name}-internet-gateway"
  }
}
