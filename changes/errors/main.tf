# Testing Terraform erros on different versions using tfswitch
resource "aws_instance" "ec2" {
    ami = "ami-032598fcc7e9d1c7a"
    instance_type = var.type
}