terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }
  backend "s3" {
    bucket = "terraform-state-sep14-2026"
    key    = "env/dev/terraform-customvpc.tfstate"
    region = "ca-central-1"
  }

  required_version = ">= 1.2"
}



