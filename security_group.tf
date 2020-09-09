resource "aws_security_group" "sg_ec2" {
    vpc_id = aws_vpc.main.id
}

# security group rules are stateful: ingress rules are automatically applied as egress ones
resource "aws_security_group_rule" "ssh_ingress_rule" {
    security_group_id = aws_security_group.sg_ec2.id
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = split(",", var.cidr_ssh_allowed)
}

resource "aws_security_group_rule" "http_ingress_rule" {
    security_group_id = aws_security_group.sg_ec2.id
    type = "ingress"
    from_port = 0
    to_port = 0
    protocol = "all"
    cidr_blocks = split(",", var.cidr_ssh_allowed)
}

# security group rules are stateful: ingress rules are automatically applied as egress ones
# since I want traffic to go out FIRST, I create an EGRESS rule instead of an INGRESS one
resource "aws_security_group_rule" "https_egress_rule" {
    security_group_id = aws_security_group.sg_ec2.id
    type = "egress"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "http_egress_rule" {
    security_group_id = aws_security_group.sg_ec2.id
    type = "egress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "code-server_ingress_rule" {
    security_group_id = aws_security_group.sg_ec2.id
    type = "ingress"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}