provider "aws" {
    region = "ap-south-1"
    profile = "configs"
  
}

resource "aws_instance" "ec2_dummy" {
    ami = var.ami_server
    instance_type = var.instance_type
    vpc_security_group_ids = ["sg-0c78535db3865697a" ,aws_security_group.demo-web-sg.id]

    tags = {
      name = "demo_ec2-dummy"
    }
  
}

resource "aws_security_group" "demo-web-sg" {
    name = "demo-web-sg"
    description = "Security group for web server"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
      ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
      egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"] 
    }
    tags = {
        Name = "demo-web-sg"
    }
}