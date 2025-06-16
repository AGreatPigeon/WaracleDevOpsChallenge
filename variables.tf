variable "aws_region" {
  default = "eu-west-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  description = "Amazon Linux 2 AMI ID"
}

variable "key_name" {
  description = "Name of the SSH keypair to attach"
}
