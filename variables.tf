variable "region" {
    default = "ap-south-1"
}

variable "vpc_cidr_block" {
    default = "10.0.0.0/16"
    description = "The CIDR block for the IPs in the vpc"
}

variable "subnet_cidr_block" {
    default = "10.0.1.0/24"
    description = "The CIDR block for the IPs in the subnet"
}

# The cidr blocks from which the 
variable "unrestricted_cidr_block" {
    default = "0.0.0.0/0"
}

variable "availability_zone" {
  default = "ap-south-1a"
}

variable "cidr_ssh_allowed" {
    default = ""
    description = "The CIDR block for IPs allowed to connect to the EC2 instances through ssh."
}

variable "ec2_instance_type" {
    default = "t2.micro"
}

variable "ec2_ami" {
    # default = "ami-0bcc094591f354be2" # non free tier
    default = "ami-090f920d1b48d8c81" # free tier
}

variable "ssh_key" {
    default = ""
    description = "Key pair to be used when connecting to the ec2 instance through ssh."
}

output "ec2_public_ip" {
  value = aws_instance.ec2_server.public_ip
  description = "The public IP of the ec2 instance to be created."
}
