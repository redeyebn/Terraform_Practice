resource "aws_security_group" "Demo_sg" {
    name = "Demo_sg"
    description = "Security group to allow all traffic."

    ingress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "Demo_sg"
    }
}

resource "aws_instance" "Demo" {
    ami = var.ami_value
    instance_type = var.instance_type_value
    subnet_id = var.subnet_id_value
    associate_public_ip_address = true
    tags = {
        Name = var.tag_value_inst1
    }
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket
  force_destroy = true
}

resource "aws_dynamodb_table" "state_lock" {
  name = var.dynamo_db_table
  hash_key = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}