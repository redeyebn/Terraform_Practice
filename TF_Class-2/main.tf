provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "demo" {
  ami = "ami-0c374876b6fc67b33"
  instance_type = "t2.micro"
  subnet_id = "subnet-0978cb5044374db7e"
  tags = {
    Name = "Demo-Server"
  }
}