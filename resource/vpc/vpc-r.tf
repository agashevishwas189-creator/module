resource "aws_vpc" "my_vpc" {
  cidr_block = var.this_cidr_block

  tags = {
    Name = var.my_vpc_name
  }
}
resource "aws_subnet" "my_public_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.this_public_subnet_cidr_block
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = var.my_public_subnet_name
  }
}