module "Demo" {
    source = "./modules"

    ami_value = "ami-0c374876b6fc67b33"
    instance_type_value = "t2.micro"
    subnet_id_value = "subnet-0978cb5044374db7e"
    tag_value_inst1 = "Demo_Instance"
    bucket = "bucket-lb-naik"
}