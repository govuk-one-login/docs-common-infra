# ============================================================================
# Future: Spoke VPC (when migrating from existing VPC)
# Uncomment when ready to migrate to new Transit Gateway VPC
# ============================================================================
/*
module "spoke-vpc" {
  source = "git@github.com:govuk-one-login/ipv-terraform-modules.git//infrastructure/spoke-vpc"

  stack_name = "docs-spoke-vpc"

  parameters = {
    TransitGatewayId                 = "tgw-xxxxxxxxxxxxxxxxx"  # Get actual TGW ID
    DisasterRecoveryTransitGatewayId = "tgw-yyyyyyyyyyyyyyyyy"  # Get actual DR TGW ID
    UseDisasterRecovery              = "No"

    IpamPool = "Production"
    VpcSize  = "Medium"

    AllowedDomains = [
      "*.gov.uk",
      "*.github.com",
      "*.githubusercontent.com",
      "fonts.googleapis.com",
      "fonts.gstatic.com"
    ]

    TestEgress     = "Yes"
    TestCustomUrls = "https://tech-docs.account.gov.uk/,https://team-manual.account.gov.uk/"

    # AWS API Endpoints
    S3ApiEnabled                = "Yes"
    CloudWatchLogsApiEnabled    = "Yes"
    KMSApiEnabled              = "Yes"
    SecretsManagerApiEnabled   = "Yes"
    SSMApiEnabled              = "Yes"
    ECRApiEnabled              = "Yes"
    CloudFormationEndpointEnabled = "Yes"
    VpcLinkEnabled              = "Yes"
    RestAPIGWVpcLinkEnabled     = "Yes"
    NlbCrossZoneEnabled         = "Yes"
    CloudWatchApiEnabled        = "Yes"
    XRayApiEnabled             = "Yes"
    SSMParametersStoreEnabled   = "Yes"
    AccessLogsCustomBucketNameEnabled = "Yes"
  }

  tags = {
    Product     = "GOV.UK One Login"
    System      = "DI Documentation"
    Environment = "production"
  }

  tags_custom = merge(local.common_tags, {
    Component = "spoke-vpc"
    Purpose   = "Network infrastructure for documentation services"
  })

  depends_on = [
    module.tgw-cross-account-role
  ]
}
*/
