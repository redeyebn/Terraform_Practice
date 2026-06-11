provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source = "./modules/ec2_instance"

  ami_id          = "ami-0c374876b6fc67b33"
  instance_type   = "t2.micro"
  subnet_id_value = "subnet-0978cb5044374db7e"
}