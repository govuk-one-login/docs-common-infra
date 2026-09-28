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
  source       = "git@github.com:govuk-one-login/ipv-terraform-modules.git//secure-pipeline/vpc?ref=vpc-cfv3.2.0-tfv0.2.0"
  stack_name = "spoke-vpc"
  on_failure = ""
  capabilities = ["CAPABILITY_AUTO_EXPAND", "CAPABILITY_NAMED_IAM"]

parameters = {
  AccessLogsCustomBucketNameEnabled = "Yes"
  AllowedDomains                    = "*.account.gov.uk,accounts.google.com,oauth2.googleapis.com,openidconnect.googleapis.com"
  AthenaApiEnabled                  = "No"
  BatchApiEnabled                   = "No"
  CloudFormationEndpointEnabled     = "No"
  CloudWatchApiEnabled              = "Yes"
  CloudWatchLogsApiEnabled          = "Yes"
  CodeBuildApiEnabled               = "No"
  CodeDeployApiEnabled              = "No"
  DynamoDBApiEnabled                = "Yes"
  DynatraceApiEnabled               = "Yes"
  ECRApiEnabled                     = "Yes"
  Environment                       = "Production"
  EventsApiEnabled                  = "No"
  ExecuteApiGatewayEnabled          = "Yes"
  FirehoseApiEnabled                = "No"
  GlueApiEnabled                    = "No"
  KMSApiEnabled                     = "Yes"
  KinesisApiEnabled                 = "No"
  LambdaApiEnabled                  = "Yes"
  RestAPIGWVpcLinkEnabled           = "No"
  S3ApiEnabled                      = "Yes"
  SESSmtpEnabled                    = "Yes"
  SNSApiEnabled                     = "Yes"
  SQSApiEnabled                     = "Yes"
  SSMApiEnabled                     = "Yes"
  SSMParametersStoreEnabled         = "Yes"
  STSApiEnabled                     = "No"
  SecretsManagerApiEnabled          = "Yes" # pragma: allowlist secret
  StatesApiEnabled                  = "Yes"
  TextractApiEnabled                = "No"
  VpcLinkEnabled                    = "Yes"
  VpcType                           = "Spoke"
  XRayApiEnabled                    = "Yes"
  DeployEgressTestLambda            = "Yes"
  EgressTestLambdaCustomURLs        = "https://accounts.google.com,https://oauth2.googleapis.com,https://openidconnect.googleapis.com"
  UseDisasterRecovery               = "No"
}

  tags = {
    Environment = "Production"
    System      = "Di Documentation"
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
