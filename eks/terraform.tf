terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.25.0"
    }
  }


  backend "s3" {
    bucket = "hotstar-bucket-backend-111"
    key    = "eks/terraform.state"
    region = "us-east-1"
  }
}