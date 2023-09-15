terraform {
  source = "tfr:///terraform-aws-modules/vpc/aws?version=5.1.2"
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "ap-south-1"
}
EOF
}