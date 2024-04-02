
resource "aws_eip" "project00-eip" {  
  depends_on = [aws_internet_gateway.project00-internet-gateway]
  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "project00-eip"
  }
}

resource "aws_nat_gateway" "project00-nat" {  
  allocation_id = aws_eip.project00-eip.id
  subnet_id  = aws_subnet.project00-public-subnet[0].id
  depends_on = [aws_internet_gateway.project00-internet-gateway]

  tags = {
    Name = "project00-nat"
  }
}