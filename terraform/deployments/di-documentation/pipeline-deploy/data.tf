data "aws_caller_identity" "current" {}

data "aws_iam_roles" "team_manual_pipeline_deploy_role" {
  name_regex = "PL-team-manual-pipeline-DeployRole"

  depends_on = [
    module.team-manual-pipeline
  ]
}