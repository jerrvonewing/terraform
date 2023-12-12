provider "aws" {
  region = "us-east-1"
}
# Create an EC2 instance
resource "aws_instance" "ec2" {
  ami = "ami-0230bd60aa48260c6"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.webtraffic.name]
}

# Create a Security Group
resource "aws_security_group" "webtraffic" {
    name = "Allow HTTPS"

    ingress = [{
        description = "Rule to allow traffic on 443"
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = null
        prefix_list_ids = null
        security_groups = null
        self = false
    }]

    egress = [{
        description = "Rule to allow traffic on 443"
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = null
        prefix_list_ids = null
        security_groups = null
        self = false
    }]
}