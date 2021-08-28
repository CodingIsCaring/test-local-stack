terraform {
//  backend "s3" {
//    bucket  = "test-local-stack-state"
//    region  = "eu-central-1"
//    key     = "terraform.tfstate"
//    encrypt = true
//    profile = "test-local-stack" // TODO Add docs about this
//  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  required_version = ">= 1.0.0"
}

provider "aws" {
  region  = "eu-central-1"
  profile = "test-local-stack"
}
