

provider "aws" {
  region= var.region
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

resource "aws_instance" "sql2019" {
  ami           = "ami-0ce37705b0668418d"
  instance_type = "t2.micro"
  key_name = var.key_name
 vpc_security_group_ids = [data.aws_security_group.IGT_Ansible.id]
  
  
}



resource "aws_instance" "centOS7" {
  ami           = "ami-005c06c6de69aee84"
  instance_type = "t2.micro"
  key_name = var.key_name
 vpc_security_group_ids = [data.aws_security_group.IGT_Ansible.id]
    

}

                                  
