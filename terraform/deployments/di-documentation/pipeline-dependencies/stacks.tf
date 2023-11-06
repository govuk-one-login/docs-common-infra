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

module "checkov-hook" {
  source     = "git@github.com:govuk-one-login/ipv-terraform-modules.git//secure-pipeline/checkov-hook"
  stack_name = "checkov-hook"
  parameters = {
    CheckovRulesToSkip = "CKV_AWS_2,CKV_AWS_18,CKV_AWS_51,CKV_AWS_103,CKV_AWS_111,CKV_AWS_116,CKV_AWS_173"
  }

  tags_custom = {
    System = "DI Documentation"
  }

  depends_on = [
    module.github-identity-provider
  ]
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
    AllowedDomains            = "*.account.gov.uk"
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
    RestAPIGWVpcLinkEnabled   = "Yes"
  }

  tags = {
    System = "DI Documentation"
  }
}
