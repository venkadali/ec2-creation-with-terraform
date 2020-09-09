resource "aws_instance" "ec2_server" {
    ami = var.ec2_ami
    instance_type = var.ec2_instance_type
    key_name = var.ssh_key
    subnet_id = aws_subnet.public_network.id
    availability_zone = var.availability_zone
    vpc_security_group_ids = [aws_security_group.sg_ec2.id]
}