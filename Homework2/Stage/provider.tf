terraform {
	backend "remote" {
		organization = "itzhak-org"
		workspaces {
			name = "Stage"
		}
	}
}


terraform {
	required_providers {
		aws = {
			source  = "hashicorp/aws"
			version	= "~>3.74.3"
		}
	}
	
	required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = var.aws_region
}


#terraform {
#  backend "s3" {
#    bucket         = "my-tf-web-log-bucket"
#    key            = "global/s3/terraform.tfstate"
#    region         = "us-east-1"
#    encrypt        = true
#  }
#}
