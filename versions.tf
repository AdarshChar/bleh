
terraform {
  required_version = "v1.14.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.7.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}
