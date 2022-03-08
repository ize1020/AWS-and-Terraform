terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
 
  # We add in the backend configuration
  backend "s3" {
    bucket                  = "my-tf-web-log-bucket"
    key                     = "cloudcasts/terraform.tfstate"
    region                  = "us-east-1"
    profile                 = "isaac"
  }
}

{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::my-tf-web-log-bucket"
    },
    {
      "Effect": "Allow",
      "Action": ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"],
      "Resource": "arn:aws:s3:::my-tf-web-log-bucket/cloudcasts/terraform.tfstate"
    }
  ]
}
