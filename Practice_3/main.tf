provider "aws" {
  region = "us-east-1"
}

# import {
#   id = "i-08c7ef9686ccbc3d7"
#   to = aws_instance.Demo
# }

resource "aws_instance" "Demo" {
  ami                                  = "ami-0b6d9d3d33ba97d99"
  associate_public_ip_address          = true
  availability_zone                    = "us-east-1f"
  disable_api_stop                     = false
  disable_api_termination              = false
  ebs_optimized                        = true
  force_destroy                        = false
  get_password_data                    = false
  hibernation                          = false
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t3.micro"
  # ipv6_address_count                   = 0
  # ipv6_addresses                       = []
  key_name                             = "demo-key"
  monitoring                           = false
  placement_partition_number           = 0
  private_ip                           = "172.31.6.114"
  region                               = "us-east-1"
  secondary_private_ips                = []
  security_groups                      = ["Demo-sg"]
  source_dest_check                    = true
  subnet_id                            = "subnet-0c93d2c8db35840c4"
  tags = {
    Name = "Demo"
  }
  tags_all = {
    Name = "Demo"
  }
  tenancy                     = "default"
  user_data                   = null
  user_data_replace_on_change = null
  volume_tags                 = null
  vpc_security_group_ids      = ["sg-0811038d21c76709d"]
  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }
  cpu_options {
    core_count       = 1
    threads_per_core = 2
  }
  credit_specification {
    cpu_credits = "unlimited"
  }
  enclave_options {
    enabled = false
  }
  maintenance_options {
    auto_recovery = "default"
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }
  # primary_network_interface {
  #   network_interface_id = "eni-0cb7601ea8b9df2a0"
  # }
  private_dns_name_options {
    enable_resource_name_dns_a_record    = false
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    iops                  = 3000
    tags                  = {}
    tags_all              = {}
    throughput            = 125
    volume_size           = 8
    volume_type           = "gp3"
  }
}

# Commands
# terraform init
# terraform plan -generate-config-out=generated_resources.tf
# terraform import aws_instance.Demo i-08c7ef9686ccbc3d7