terraform {
  backend "s3" {
    bucket = "bucket-lb-naik"
    key = "Demo/teraform.tfvars"
    region = "us-east-1"
  }
}