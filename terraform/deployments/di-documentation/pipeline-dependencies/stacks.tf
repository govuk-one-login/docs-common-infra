module "github-identity-provider" {
  source     = "git@github.com:govuk-one-login/ipv-terraform-modules.git//secure-pipeline/github-identity-provider"
  stack_name = "github-identity"
  parameters = {
    Environment = "build"
    System      = "DI Documentation"
  }

  tags = {
    System = "DI Documentation"
  }
}

module "aws-signer" {
  source     = "git@github.com:govuk-one-login/ipv-terraform-modules.git//secure-pipeline/aws-signer"
  stack_name = "aws-signer-pipeline"
  parameters = {
    Environment = "build"
    System      = "DI Documentation"
  }

  tags_custom = {
    System = "DI Documentation"
  }
}

module "container-signer" {
  source     = "git@github.com:govuk-one-login/ipv-terraform-modules.git//secure-pipeline/container-signer"
  stack_name = "container-signer-pipeline"
  parameters = {
    Environment     = "build"
    AllowedAccounts = "826978934233"
    System          = "DI Documentation"
  }

  tags_custom = {
    System = "DI Documentation"
  }
}

module "infra-audit-hook" {
  source     = "git@github.com:govuk-one-login/ipv-terraform-modules.git//secure-pipeline/infra-audit-hook"
  stack_name = "infra-audit-hook-pipeline"

  tags_custom = {
    System = "DI Documentation"
  }
}


module "slack-notifications" {
  source     = "git@github.com:govuk-one-login/ipv-terraform-modules.git//secure-pipeline/slack-notifications"
  stack_name = "di-documentation-notifications"
  parameters = {
    SlackChannelId   = "C055U5KJ3SP"
    SlackWorkspaceId = "T8GT9416G"
  }

  tags_custom = {
    System = "DI Documentation"
  }
}

module "certificate-expiry" {
  source     = "git@github.com:govuk-one-login/ipv-terraform-modules.git//secure-pipeline/certificate-expiry"
  stack_name = "cert-expiry-pipeline"
  parameters = {
    DaysBeforeExpiry = 30
  }

  tags_custom = {
    System = "DI Documentation"
  }
}


module "vpc" {
  source           = "git@github.com:govuk-one-login/ipv-terraform-modules.git//secure-pipeline/vpc"
  stack_name       = "vpc"
  allow_rules_file = "firewall_rules.txt"
  parameters = {
    CidrBlock                 = "10.9.0.0/16"
    AvailabilityZoneCount     = 2
    ZoneAEIPAllocationId      = "none"
    ZoneBEIPAllocationId      = "none"
    ZoneCEIPAllocationId      = "none"
    VpcLinkEnabled            = "Yes"
    AllowedDomains            = "*.account.gov.uk,accounts.google.com,oauth2.googleapis.com,openidconnect.googleapis.com"
    LogsApiEnabled            = "Yes"
    CloudWatchApiEnabled      = "Yes"
    XRayApiEnabled            = "Yes"
    SSMApiEnabled             = "Yes"
    SecretsManagerApiEnabled  = "Yes"
    KMSApiEnabled             = "Yes"
    DynamoDBApiEnabled        = "Yes"
    S3ApiEnabled              = "Yes"
    SQSApiEnabled             = "Yes"
    SNSApiEnabled             = "Yes"
    KinesisApiEnabled         = "No"
    FirehoseApiEnabled        = "No"
    EventsApiEnabled          = "No"
    StatesApiEnabled          = "Yes"
    ECRApiEnabled             = "Yes"
    LambdaApiEnabled          = "Yes"
    CodeDeployApiEnabled      = "No"
    ExecuteApiGatewayEnabled  = "Yes"
    SSMParametersStoreEnabled = "Yes"
    RestAPIGWVpcLinkEnabled   = "No"
  }

  tags = {
    System = "DI Documentation"
  }
}

module "spoke-vpc" {
  source       = "git@github.com:govuk-one-login/ipv-terraform-modules.git//secure-pipeline/spoke-vpc?ref=spoke-vpc-cfv2.0.4-tfv1.1.1"
  stack_name = "spoke-vpc-idsre"
  on_failure = ""
  capabilities = ["CAPABILITY_AUTO_EXPAND", "CAPABILITY_NAMED_IAM"]

parameters = {
  AccessLogsCustomBucketNameEnabled = "Yes"
  AllowedDomains                    = "*.account.gov.uk,accounts.google.com,oauth2.googleapis.com,openidconnect.googleapis.com"
  AthenaApiEnabled                  = "No"
  BatchApiEnabled                   = "No"
  CloudFormationEndpointEnabled     = "No"
  CloudWatchApiEnabled              = "Yes"
  CloudWatchLogsApiEnabled          = "No"
  CodeBuildApiEnabled               = "No"
  CodeDeployApiEnabled              = "No"
  DynamoDBApiEnabled                = "No"
  DynatraceApiEnabled               = "Yes"
  ECRApiEnabled                     = "No"
  EventsApiEnabled                  = "No"
  ExecuteApiGatewayEnabled          = "No"
  FirehoseApiEnabled                = "No"
  GlueApiEnabled                    = "No"
  KMSApiEnabled                     = "Yes"
  KinesisApiEnabled                 = "No"
  LambdaApiEnabled                  = "No"
  LogsApiEnabled                    = "Yes"
  RestAPIGWVpcLinkEnabled           = "No"
  S3ApiEnabled                      = "Yes"
  SESApiEnabled                     = "No"
  SESSmtpEnabled                    = "Yes"
  SNSApiEnabled                     = "Yes"
  SQSApiEnabled                     = "Yes"
  SSMApiEnabled                     = "Yes"
  SSMParametersStoreEnabled         = "No"
  STSApiEnabled                     = "No"
  SecretsManagerApiEnabled          = "Yes" # pragma: allowlist secret
  StatesApiEnabled                  = "Yes"
  TextractApiEnabled                = "No"
  VpcLinkEnabled                    = "No"
  XRayApiEnabled                    = "Yes"
  ZoneAEIPAllocationId              = "none"
  ZoneBEIPAllocationId              = "none"
  ZoneCEIPAllocationId              = "none"
  VpcSize                           = "Medium"
  TransitGatewayId                  = "tgw-00941dcb040644b98"
  TestEgress                        = "Yes"
  TestCustomUrls                    = "https://accounts.google.com,https://oauth2.googleapis.com,https://openidconnect.googleapis.com"
  IpamPool                          = "Production"
  DisasterRecoveryTransitGatewayId  = "tgw-02ad17b20fa31c6b1"
  UseDisasterRecovery               = "No"
}

  tags = {
    Environment = "dev"
    System      = "Identity SRE"
    Product     = "GOV.UK One Login"
  }

}

module "tgw-cross-account-role" {
  source = "git@github.com:govuk-one-login/ipv-terraform-modules.git//secure-pipeline/tgw-cross-account-role?ref=tgw-cross-account-role-cfv2.0.1-tfv1.1.0"

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

  tags_custom = merge(local.tags, {
    Component = "tgw-cross-account-role"
    Purpose   = "Enable Transit Gateway connectivity for documentation services"
  })
}
