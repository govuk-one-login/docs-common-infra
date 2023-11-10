resource "aws_iam_policy" "team_manual_pipeline_deploy_role_override_policy" {
  name        = "deploy_role_team_manual_override_policy"
  path        = "/"
  description = "This policy overrides the restrictions imposed by secure pipelines to allow deployment to the public subnet"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid = "RoleManagementOverRide"
        Action = [
          "elasticloadbalancing:SetSubnets"
        ],
        Effect = "Allow"
        Resource = [
          "arn:aws:elasticloadbalancing:eu-west-2:${local.account_id}:loadbalancer/*"
        ],
      },
    ]
  })
}



resource "aws_iam_policy_attachment" "secure_pipeline_core_back_deploy_policy_override" {
  name       = "secure_pipeline_core_back_deploy_policy_override"
  roles      = data.aws_iam_roles.team_manual_pipeline_deploy_role.names
  policy_arn = aws_iam_policy.team_manual_pipeline_deploy_role_override_policy.arn

  depends_on = [
    module.team-manual-pipeline
  ]
}