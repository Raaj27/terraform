


  provider "aws" {
 region = var.region
}
  
variable "instance_count" {
  default = 2
  }



data "aws_security_group" "IGT_Ansible" {
  name= "IGT_Ansible"
}

variable "region" {
  default = "us-west-2"
}
variable "key_name" {
  default = "windowssql"
}

resource "aws_instance" "centOS7" {
  ami           = "ami-005c06c6de69aee84"
  count         = local.instance_count
  instance_type = "t2.micro"
  key_name = var.key_name
 vpc_security_group_ids = [data.aws_security_group.IGT_Ansible.id]
    

}



