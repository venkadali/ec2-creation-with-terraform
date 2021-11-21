terraform {
    required_providers {
        aws = "~> 3.0"
    }
}

# Configure the AWS provider
provider "aws" {
    region = "ap-south-1"
}
