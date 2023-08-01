terraform {
  required_version = ">= 1.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.67"
    }
    awscc = {
      source  = "hashicorp/awscc"
      version = ">= 0.52"
    }
  }
}
