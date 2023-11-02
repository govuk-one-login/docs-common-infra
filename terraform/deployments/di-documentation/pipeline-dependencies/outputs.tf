output "aws-signer_stack_id" {
  value = module.aws-signer.stack_id
}
output "aws-signer_stack_outputs" {
  value = module.aws-signer.stack_outputs
}
output "aws-signer_stack_tags" {
  value = module.aws-signer.stack_tags
}

output "container-signer_stack_id" {
  value = module.container-signer.stack_id
}
output "container-signer_stack_outputs" {
  value = module.container-signer.stack_outputs
}
output "container-signer_stack_tags" {
  value = module.container-signer.stack_tags
}

output "checkov-hook_stack_id" {
  value = module.checkov-hook.stack_id
}
output "checkov-hook_stack_outputs" {
  value = module.checkov-hook.stack_outputs
}
output "checkov-hook_stack_tags" {
  value = module.checkov-hook.stack_tags
}

output "infra-audit-hook_stack_id" {
  value = module.infra-audit-hook.stack_id
}
output "infra-audit-hook_stack_outputs" {
  value = module.infra-audit-hook.stack_outputs
}
output "infra-audit-hook_stack_tags" {
  value = module.infra-audit-hook.stack_tags
}

#output "grafana-metrics_stack_id" {
#  value = module.grafana-metrics.stack_id
#}
#output "grafana-metrics_stack_outputs" {
#  value = module.grafana-metrics.stack_outputs
#}
#output "grafana-metrics_stack_tags" {
#  value = module.grafana-metrics.stack_tags
#}
#
#output "grafana-key-rotation_stack_id" {
#  value = module.grafana-key-rotation.stack_id
#}
#output "grafana-key-rotation_stack_outputs" {
#  value = module.grafana-key-rotation.stack_outputs
#}
#output "grafana-key-rotation_stack_tags" {
#  value = module.grafana-key-rotation.stack_tags
#}


output "slack-notifications_stack_id" {
  value = module.slack-notifications.stack_id
}
output "slack-notifications_stack_outputs" {
  value = module.slack-notifications.stack_outputs
}
output "slack-notifications_stack_tags" {
  value = module.slack-notifications.stack_tags
}

output "certificate-expiry_stack_id" {
  value = module.certificate-expiry.stack_id
}
output "certificate-expiry_stack_outputs" {
  value = module.certificate-expiry.stack_outputs
}
output "certificate-expiry_stack_tags" {
  value = module.certificate-expiry.stack_tags
}

output "vpc_stack_id" {
  value = module.vpc.stack_id
}
output "vpc_stack_outputs" {
  value = module.vpc.stack_outputs
}
output "vpc_stack_tags" {
  value = module.vpc.stack_tags
}
