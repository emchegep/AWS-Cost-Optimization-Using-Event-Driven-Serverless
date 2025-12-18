terraform {
  required_version = ">= 1.13.0" # Ensure that the Terraform version is 1.0.0 or higher

  required_providers {
    aws = {
      source  = "hashicorp/aws" # Specify the source of the AWS provider
      version = "~> 6.0"        # Use a version of the AWS provider that is compatible with version
    }
  }

  backend "s3" {
    bucket = "devops-skool-tf-states"
    key    = "cost-optimization/terraform.tfstate"
    region = "us-east-2"
  }
}

provider "aws" {
  region = var.region
}
