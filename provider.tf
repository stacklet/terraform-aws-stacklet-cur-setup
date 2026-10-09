terraform {
  # The floor is a Terraform line that still receives patches. This module uses
  # nothing newer than the language has had for years, so the constraint is
  # about support rather than features, and 1.13 and earlier no longer get
  # security fixes.
  required_version = ">= 1.14.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {}
