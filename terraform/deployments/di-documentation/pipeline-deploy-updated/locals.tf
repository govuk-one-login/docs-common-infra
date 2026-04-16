locals {
  account_id = data.aws_caller_identity.current.account_id

  # Common tags for all resources
  common_tags = {
    Product     = "GOV.UK One Login"
    System      = "DI Documentation"
    Environment = "production"
    Service     = "documentation-infra"
    Owner       = "platform-and-sre-pod@digital.cabinet-office.gov.uk"
    Account     = "di-documentation"
  }
}
