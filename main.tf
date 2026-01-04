provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "self_heal_ec2" {
  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = "t2.micro"

  tags = {
    Name = "Self-Healing-EC2"
  }
}
