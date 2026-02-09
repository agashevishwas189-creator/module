provider "aws" {
    region = ap-south-1
    profile = "configs"
  shared_credentials_files  = ["/root/.aws/credentials"]
}

 terraform  {
        backend "s3" {
        bucket = "learning-dem-1"
        key = "terraform.tfstate"
        dynamodb_table = "vishwas"  #or can use use_lockfile = true
        region = "ap-south-1"
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

