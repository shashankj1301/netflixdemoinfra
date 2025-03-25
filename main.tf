provider "aws" {
region = "us-east-1"
}

resource "aws_instance" "one" {
count = 5
ami = "ami-04aa00acb1165b32a"
instance_type = "t2.medium"
key_name = "sample"
vpc_security_group_ids = ["sg-0968fc65a89aee561"]
tags = {
Name = var.instance_names[count.index]
}
}

variable "instance_names" {
default = ["jenkins", "nexus", "AppServer-1", "AppServer-2", "Monitoring server"]
}
