variable "bucket_name" {
  description = "Name of the S3 bucket"
  default     = "waracle-devops-challenge-static-site-unique" # Replace with unique bucket name globally
}

variable "aws_region" {
  default = "eu-west-1"
}
