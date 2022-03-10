provider "aws" {
  profile = "default"
  region  = var.aws_region
}


terraform {
  backend "s3" {
    bucket         = "my-tf-web-log-bucket"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}