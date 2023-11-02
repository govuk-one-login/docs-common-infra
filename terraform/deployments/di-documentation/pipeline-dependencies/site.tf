terraform {
  required_version = ">= 1.3.0"

  # Comment out when bootstrapping
  backend "s3" {
    bucket = "di-documentation-tfstate"
    key    = "di-documentation/pipeline_dependencies.tfstate"
    region = "eu-west-2"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  allowed_account_ids = ["203073707786"]
  region              = "eu-west-2"
}

module "state_bucket" {
  source         = "git@github.com:govuk-one-login/ipv-terraform-modules.git//common/state-bucket-logging-tls"
  bucket_name    = "di-documentation-tfstate"
  logging_bucket = "di-documentation-access-logs"
  enable_tls     = true
}

module "logging_bucket" {
  source         = "git@github.com:govuk-one-login/ipv-terraform-modules.git//common/state-bucket-logging-tls"
  bucket_name    = "di-documentation-access-logs"
  enable_tls     = true
}
