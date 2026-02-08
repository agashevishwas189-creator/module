provider "aws" {
    region = "ap-south-1"
    profile = "configs"
  
}

resource "aws_instance" "ec2_dummy" {
    ami = var.ami_server
    instance_type = var.instance_type

    tags = {
      name = "demo_ec2-dummy"
    }
  
}

