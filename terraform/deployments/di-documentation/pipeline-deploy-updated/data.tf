data "aws_caller_identity" "current" {}

data "aws_organizations_organization" "gds" {}

data "aws_cloudformation_stack" "aws-signer" {
  name = "aws-signer-pipeline"
}

data "aws_cloudformation_stack" "container-signer" {
  name = "container-signer-pipeline"
}
