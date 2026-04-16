# ============================================================================
# TGW Cross-Account Role - MUST BE DEPLOYED FIRST
# This enables Transit Gateway connectivity for documentation services
# ============================================================================

module "tgw-cross-account-role" {
  source = "git@github.com:govuk-one-login/ipv-terraform-modules.git//infrastructure/tgw-cross-account-role"

  stack_name = "tgw-cross-account-role"

  parameters = {
    HubAccountId                 = "510900712898"  # Production Hub Account
    DisasterRecoveryHubAccountId = "748599135734"  # Production DR Hub Account
    MaxSessionDurationSeconds    = 3600
    AllowedRegion               = "eu-west-2"
  }

  tags = {
    Product     = "GOV.UK One Login"
    System      = "DI Documentation"
    Environment = "production"
  }

  tags_custom = merge(local.common_tags, {
    Component = "tgw-cross-account-role"
    Purpose   = "Enable Transit Gateway connectivity for documentation services"
  })
}
