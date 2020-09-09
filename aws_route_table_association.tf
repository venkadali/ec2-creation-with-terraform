resource "aws_route_table_association" "subnet_route" {
    subnet_id = aws_subnet.public_network.id
    route_table_id = aws_route_table.public_route.id
}