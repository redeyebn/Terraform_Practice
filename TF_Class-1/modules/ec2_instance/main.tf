resource "aws_security_group" "allow_all" {
  name        = "allow-all-traffic"
  description = "Allow all inbound and outbound traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-all-sg"
  }
}

resource "aws_instance" "webserver" {
  ami                         = var.ami_id # Amazon Linux 2023 (verify latest AMI)
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id_value
  vpc_security_group_ids      = [aws_security_group.allow_all.id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install httpd -y
              systemctl start httpd
              systemctl enable httpd

              echo "<h1>Welcome to Terraform EC2 Server</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "Terraform-WebServer"
  }
}
