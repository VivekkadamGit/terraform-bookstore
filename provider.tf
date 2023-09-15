
# Provider Block
provider "aws" {
  region  = var.aws_region
  # Better to use the AWS Config to store access/secret key in local env.
  # access_key = "***"
  # secret_key = "****"
}

#TFstate file will be store inside your private S3 bucket
terraform {

  backend "s3" {
    bucket = "promact-terraform-bucket"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}
