





variable "instance_count" {
  default = 1
  }


  provider "aws" {
 region = var.region
}

data "aws_security_group" "default" {
  name= "default"
}

variable "region" {
  default = "us-west-1"
}
variable "key_name" {
  default = "windowssql"
}


resource "aws_instance" "centOS7" {
  ami           = "ami-024d79f468ff716c1"
  instance_type = "t2.micro"
  key_name = var.key_name
 vpc_security_group_ids = [data.aws_security_group.default.id]
    count = var.instance_count
  tags = {Name = "CentOS7"}
}

output "private_ips" {
  value =join(" ", aws_instance.centOS7[*].private_ip)
}

                      

