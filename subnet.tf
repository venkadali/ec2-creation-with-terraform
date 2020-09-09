resource "aws_subnet" "public_network" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.subnet_cidr_block
    availability_zone = var.availability_zone
    map_public_ip_on_launch = true

    depends_on = [aws_internet_gateway.igw]
}