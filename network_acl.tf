resource "aws_network_acl" "main_nacl" {
    vpc_id = aws_vpc.main.id
    subnet_ids = [aws_subnet.public_network.id]

    egress {
        rule_no = 10
        action = "allow"
        protocol = "all"
        cidr_block = "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }

    ingress {
        rule_no = 20
        action = "allow"
        protocol = "all"
        cidr_block = "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }
}