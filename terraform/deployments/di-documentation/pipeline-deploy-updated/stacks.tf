# ============================================================================
# APPLICATION PIPELINES AND SERVICES
# These will be migrated from pipeline-deploy when ready
# ============================================================================

# Uncomment when ready to migrate from existing pipeline-deploy

/*
# DNS Zones Pipeline
module "dns-zones-pipeline" {
  source     = "git@github.com:govuk-one-login/ipv-terraform-modules.git//secure-pipeline/deploy-pipeline"
  stack_name = "dns-zones-pipeline"
  parameters = {
    SAMStackName               = "dns-zones"
    Environment                = "build"
    VpcStackName               = "vpc"
    IncludePromotion           = "No"
    LogRetentionDays           = 30
    SigningProfileArn          = data.aws_cloudformation_stack.aws-signer.outputs["SigningProfileArn"]
    SigningProfileVersionArn   = data.aws_cloudformation_stack.aws-signer.outputs["SigningProfileVersionArn"]
    OneLoginRepositoryName     = "docs-common-infra"
    SlackNotificationType      = "Failures"
    BuildNotificationStackName = "di-documentation-notifications"
  }

  tags_custom = merge(local.common_tags, {
    Component           = "dns-zones-pipeline"
    CheckovRulesToSkip = "CKV_AWS_111"
  })
}

# Team Manual Pipeline
module "team-manual-pipeline" {
  source     = "git@github.com:govuk-one-login/ipv-terraform-modules.git//secure-pipeline/deploy-pipeline"
  stack_name = "team-manual-pipeline"
  parameters = {
    SAMStackName               = "team-manual"
    Environment                = "build"
    VpcStackName               = "vpc"
    IncludePromotion           = "No"
    LogRetentionDays           = 30
    ContainerSignerKmsKeyArn   = data.aws_cloudformation_stack.container-signer.outputs["ContainerSignerKmsKeyArn"]
    SigningProfileArn          = data.aws_cloudformation_stack.aws-signer.outputs["SigningProfileArn"]
    SigningProfileVersionArn   = data.aws_cloudformation_stack.aws-signer.outputs["SigningProfileVersionArn"]
    GitHubRepositoryName       = "digital-identity-team-manual"
    OneLoginRepositoryName     = "team-manual"
    SlackNotificationType      = "Failures"
    BuildNotificationStackName = "di-documentation-notifications"
  }

  tags_custom = merge(local.common_tags, {
    Component = "team-manual-pipeline"
  })
}

# Add other pipelines here when migrating...
*/
