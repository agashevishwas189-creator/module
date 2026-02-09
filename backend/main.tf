provider "aws" {
    region = ap-south-1
    profile = "configs"
  shared_credentials_files  = ["/root/.aws/credentials"]
}

 terraform  {
        required_version = ">= 0.12" {
        backend "s3" {
        bucket = "learning-dem-1"
        key = "terraform.tfstate"
        dynamodb_table = "vishwas"
        region = ap-south-1
        profile = "configs"
        shared_credentials_files  = ["/root/.aws/credentials"]
    }
     }  

}

resource "aws_instance" "ec2-instance" {
  ami           = var.aws_ami_id
  instance_type = var.instance_type

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install httpd -y      
              systemctl start httpd
              systemctl enable httpd
              echo "Hello World from $(hostname)" > /var/www/html/index.html

             EOF
}

