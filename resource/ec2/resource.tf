resource "aws_instance" "web_server" {
    ami = var.ami_webserver
    instance_type = var.instance_type
    #vpc_security_group_ids = [var.vpc_security_group_id , aws_security_group.my-web-sg.id]
    subnet_id = var.ec2_instance_subnet_id

  tags = {
    Name = "terraform-web-server"
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "<h1>Welcome to Terraform Web Server</h1>" > /var/www/html/index.html
              EOF
}   

resource "aws_security_group" "my-web-sg" {
    name = "my-web-sg"
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
        Name = "my-web-sg"
    }
}
  
