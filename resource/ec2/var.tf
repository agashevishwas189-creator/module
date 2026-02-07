variable "ami_webserver" {
    type = string
    default = "ami-0c55b159cbfafe1d0"

}

variable "instance_type" {
    type = string
    default = "t3.mirco"
  
}

variable "vpc_security_group_id" {
  type = string
  default = "sg-0c78535db3865697a"
    
}
