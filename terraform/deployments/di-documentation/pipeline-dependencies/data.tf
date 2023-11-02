data "aws_organizations_organization" "gds" {}

data "aws_cloudformation_stack" "aws-signer" {
  name = "aws-signer-pipeline"

  depends_on = [
    module.aws-signer
  ]
}

data "aws_cloudformation_stack" "container-signer" {
  name = "container-signer-pipeline"

  depends_on = [
    module.container-signer
  ]
}
