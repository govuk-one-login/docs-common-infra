resource "aws_iam_role_policy" "team_manual_pipeline_deploy_role_override" {
  for_each = toset(data.aws_iam_roles.team_manual_pipeline_deploy_role.names)
  name     = "deploy_role_team_manual_override_policy"
  role     = each.value

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "RoleManagementOverRide"
        Action = ["elasticloadbalancing:SetSubnets"]
        Effect = "Allow"
        Resource = [
          "arn:aws:elasticloadbalancing:eu-west-2:${local.account_id}:loadbalancer/*"
        ]
      }
    ]
  })

  depends_on = [module.team-manual-pipeline]
}