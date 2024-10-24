data "aws_organizations_organization" "gds" {
}

data "aws_cloudformation_stack" "aws-signer" {
  name = "aws-signer-pipeline"
}

data "aws_cloudformation_stack" "container-signer" {
  name = "container-signer-pipeline"
}

module "team-manual-ecr" {
  source     = "git@github.com:govuk-one-login/ipv-terraform-modules.git//secure-pipeline/container-image-repository"
  stack_name = "team-manual-ecr"
  parameters = {
    PipelineStackName = "team-manual-pipeline"
    #AWSOrganizationId = data.aws_organizations_organization.gds.id
  }

  tags_custom = {
    System = "DI Documentation"
  }

  depends_on = [
    module.team-manual-pipeline
  ]
}

module "tech-docs-ecr" {
  source     = "git@github.com:govuk-one-login/ipv-terraform-modules.git//secure-pipeline/container-image-repository"
  stack_name = "tech-docs-ecr"
  parameters = {
    PipelineStackName = "tech-docs-pipeline"
    #AWSOrganizationId = data.aws_organizations_organization.gds.id
  }

  tags_custom = {
    System = "DI Documentation"
  }

  depends_on = [
    module.tech-docs-pipeline
  ]
}

module "event-catalogue-ecr" {
  source     = "git@github.com:govuk-one-login/ipv-terraform-modules.git//secure-pipeline/container-image-repository"
  stack_name = "event-catalogue-ecr"
  parameters = {
    PipelineStackName = "event-catalogue-pipeline"
    #AWSOrganizationId = data.aws_organizations_organization.gds.id
  }

  tags_custom = {
    System = "DI Documentation"
  }

  depends_on = [
    module.event-catalogue-pipeline
  ]
}

module "data-exchange-catalogue-detailed-ecr" {
  source     = "git@github.com:govuk-one-login/ipv-terraform-modules.git//secure-pipeline/container-image-repository"
  stack_name = "data-exchange-catalogue-detailed-ecr"
  parameters = {
    PipelineStackName = "data-exchange-catalogue-detailed-pipeline"
    #AWSOrganizationId = data.aws_organizations_organization.gds.id
  }

  tags_custom = {
    System = "DI Documentation"
  }

  depends_on = [
    module.data-exchange-catalogue-detailed-pipeline
  ]
}

module "dns-zones-pipeline" {
  source     = "git@github.com:govuk-one-login/ipv-terraform-modules.git//secure-pipeline/deploy-pipeline"
  stack_name = "dns-zones-pipeline"
  parameters = {
    SAMStackName               = "dns-zones"
    Environment                = "build"
    VpcStackName               = "vpc"
    IncludePromotion           = "No"
    #AWSOrganizationId          = data.aws_organizations_organization.gds.id
    LogRetentionDays           = 30
    SigningProfileArn          = data.aws_cloudformation_stack.aws-signer.outputs["SigningProfileArn"]
    SigningProfileVersionArn   = data.aws_cloudformation_stack.aws-signer.outputs["SigningProfileVersionArn"]
    OneLoginRepositoryName     = "docs-common-infra"
    SlackNotificationType      = "Failures"
    BuildNotificationStackName = "di-documentation-notifications"
  }

  tags_custom = {
    System             = "DI Documentation"
    CheckovRulesToSkip = "CKV_AWS_111"
  }
}


module "docs-waf-pipeline" {
  source     = "git@github.com:govuk-one-login/ipv-terraform-modules.git//secure-pipeline/deploy-pipeline"
  stack_name = "docs-waf-pipeline"
  parameters = {
    SAMStackName               = "docs-waf"
    Environment                = "build"
    VpcStackName               = "vpc"
    IncludePromotion           = "No"
    #AWSOrganizationId          = data.aws_organizations_organization.gds.id
    LogRetentionDays           = 30
    SigningProfileArn          = data.aws_cloudformation_stack.aws-signer.outputs["SigningProfileArn"]
    SigningProfileVersionArn   = data.aws_cloudformation_stack.aws-signer.outputs["SigningProfileVersionArn"]
    OneLoginRepositoryName     = "docs-common-infra"
    SlackNotificationType      = "Failures"
    BuildNotificationStackName = "di-documentation-notifications"
  }

  tags_custom = {
    System             = "DI Documentation"
    CheckovRulesToSkip = "CKV_AWS_111"
  }
}


module "team-manual-pipeline" {
  source     = "git@github.com:govuk-one-login/ipv-terraform-modules.git//secure-pipeline/deploy-pipeline"
  stack_name = "team-manual-pipeline"
  parameters = {
    SAMStackName               = "team-manual"
    Environment                = "build"
    VpcStackName               = "vpc"
    IncludePromotion           = "No"
    #AWSOrganizationId          = data.aws_organizations_organization.gds.id
    LogRetentionDays           = 30
    ContainerSignerKmsKeyArn   = data.aws_cloudformation_stack.container-signer.outputs["ContainerSignerKmsKeyArn"]
    SigningProfileArn          = data.aws_cloudformation_stack.aws-signer.outputs["SigningProfileArn"]
    SigningProfileVersionArn   = data.aws_cloudformation_stack.aws-signer.outputs["SigningProfileVersionArn"]
    GitHubRepositoryName       = "digital-identity-team-manual"
    OneLoginRepositoryName     = "team-manual"
    SlackNotificationType      = "Failures"
    BuildNotificationStackName = "di-documentation-notifications"
  }

  tags_custom = {
    System             = "DI Documentation"
  }
}

module "tech-docs-pipeline" {
  source     = "git@github.com:govuk-one-login/ipv-terraform-modules.git//secure-pipeline/deploy-pipeline"
  stack_name = "tech-docs-pipeline"
  parameters = {
    SAMStackName               = "tech-docs"
    Environment                = "build"
    VpcStackName               = "vpc"
    IncludePromotion           = "No"
    #AWSOrganizationId          = data.aws_organizations_organization.gds.id
    LogRetentionDays           = 30
    ContainerSignerKmsKeyArn   = data.aws_cloudformation_stack.container-signer.outputs["ContainerSignerKmsKeyArn"]
    SigningProfileArn          = data.aws_cloudformation_stack.aws-signer.outputs["SigningProfileArn"]
    SigningProfileVersionArn   = data.aws_cloudformation_stack.aws-signer.outputs["SigningProfileVersionArn"]
    OneLoginRepositoryName     = "tech-docs"
    SlackNotificationType      = "Failures"
    BuildNotificationStackName = "di-documentation-notifications"
  }

  tags_custom = {
    System             = "DI Documentation"
  }
}

module "event-catalogue-pipeline" {
  source     = "git@github.com:govuk-one-login/ipv-terraform-modules.git//secure-pipeline/deploy-pipeline"
  stack_name = "event-catalogue-pipeline"
  parameters = {
    SAMStackName               = "event-catalogue"
    Environment                = "dev"
    VpcStackName               = "vpc"
    IncludePromotion           = "No"
    #AWSOrganizationId          = data.aws_organizations_organization.gds.id
    LogRetentionDays           = 7
    ContainerSignerKmsKeyArn   = data.aws_cloudformation_stack.container-signer.outputs["ContainerSignerKmsKeyArn"]
    SigningProfileArn          = data.aws_cloudformation_stack.aws-signer.outputs["SigningProfileArn"]
    SigningProfileVersionArn   = data.aws_cloudformation_stack.aws-signer.outputs["SigningProfileVersionArn"]
    OneLoginRepositoryName     = "event-catalogue"
    SlackNotificationType      = "None"
    BuildNotificationStackName = "di-documentation-notifications"
  }

  tags_custom = {
    System             = "DI Documentation"
  }
}

module "data-exchange-catalogue-detailed-pipeline" {
  source     = "git@github.com:govuk-one-login/ipv-terraform-modules.git//secure-pipeline/deploy-pipeline"
  stack_name = "data-exchange-catalogue-detailed-pipeline"
  parameters = {
    SAMStackName               = "data-exchange-catalogue-detailed"
    Environment                = "dev"
    VpcStackName               = "vpc"
    IncludePromotion           = "No"
    #AWSOrganizationId          = data.aws_organizations_organization.gds.id
    LogRetentionDays           = 7
    ContainerSignerKmsKeyArn   = data.aws_cloudformation_stack.container-signer.outputs["ContainerSignerKmsKeyArn"]
    SigningProfileArn          = data.aws_cloudformation_stack.aws-signer.outputs["SigningProfileArn"]
    SigningProfileVersionArn   = data.aws_cloudformation_stack.aws-signer.outputs["SigningProfileVersionArn"]
    OneLoginRepositoryName     = "ssf-vocab"
    SlackNotificationType      = "None"
    BuildNotificationStackName = "di-documentation-notifications"
  }

  tags_custom = {
    System             = "DI Documentation"
  }
}
