module "ec2" {
  source = "../resource/ec2"
  ami_webserver = "ami-0c55b159cbfafe1d0"
  instance_type = "t3.micro"
  #vpc_security_group_id = ["sg-0c78535db3865697a"]
  ec2_instance_subnet_id = module.vpc.aws_subnet_id

}
module "vpc" {
  source = "../resource/vpc"
  this_cidr_block = "10.0.0.0/16"
  this_public_subnet_cidr_block = "10.0.1.0/24"
  my_public_subnet_name = "my-public-subnet"
  my_vpc_name = "my-vpc"
  map_public_ip_on_launch = true

}