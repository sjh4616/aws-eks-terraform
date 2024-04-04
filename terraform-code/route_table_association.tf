// Public Router
resource "aws_route_table_association" "project00-route-association-public-sub2" {

    count = length(var.aws_vpc_public_subnets)
    subnet_id = aws_subnet.project00-public-subnet[count.index].id
    route_table_id = aws_route_table.project00-route-table-public-sub.id
    
}

// Private Router
resource "aws_route_table_association" "project00-route-association-private-sub" {
    count           = length(var.aws_vpc_private_subnets)
    subnet_id       = aws_subnet.project00-private-subnet[count.index].id
    route_table_id  = aws_route_table.project00-route-table-private-sub.id
}