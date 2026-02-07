resource "aws_instance" "web_server" {
    ami = var.ami_webserver
    instance_type = var.instance_type
    vpc_security_group_ids = [var.vpc_security_group_id]
    tags = {
        Name = "terraform-web-server"
    }
}