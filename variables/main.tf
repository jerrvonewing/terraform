variable "vpc-name" {
    type = string
    default = "myvpc"
}

variable "vpc-region" {
    type = string
    default = "us-east-1"
}

variable "sshport" {
    type = number
    default = 22
}

variable "enabled" {
    default = true
}

variable "mylist" {
    type = list(string)
    default = [ "value1", "value2"]
}

variable "mymap" {
    type = map
    default = { 
        Key1 = "value1" 
        Key2 = "value2"}
}

variable "inputname" {
    type = string
    description = "Set the name of the vpc"
}

provider "aws" {
    region = var.vpc-region
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name =  var.inputname
    }
}

output "vpc-id" {
    value = aws_vpc.myvpc.id
}

variable "mytuple" {
    type = tuple(string, number, string)
    default = ["cat", 1, "dog"]
}

variable "myobject" {
    type = object({
      name = string,
      port = list(number)
      default = {
        name = "jerrvon"
        port = [22,25,80]
      }
    })
  
}