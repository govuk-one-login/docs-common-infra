output "dns-zones-pipeline_stack_id" {
  value = module.dns-zones-pipeline.stack_id
}
output "dns-zones-pipeline_stack_outputs" {
  value = module.dns-zones-pipeline.stack_outputs
}
output "dns-zones-pipeline_stack_tags" {
  value = module.dns-zones-pipeline.stack_tags
}

output "team-manual-ecr_stack_id" {
  value = module.team-manual-ecr.stack_id
}
output "team-manual-ecr_stack_outputs" {
  value = module.team-manual-ecr.stack_outputs
}
output "team-manual-ecr_stack_tags" {
  value = module.team-manual-ecr.stack_tags
}

output "team-manual-pipeline_stack_id" {
  value = module.team-manual-pipeline.stack_id
}
output "team-manual-pipeline_stack_outputs" {
  value = module.team-manual-pipeline.stack_outputs
}
output "team-manual-pipeline_stack_tags" {
  value = module.team-manual-pipeline.stack_tags
}

output "docs-waf-pipeline_stack_id" {
  value = module.docs-waf-pipeline.stack_id
}
output "docs-waf-pipeline_stack_outputs" {
  value = module.docs-waf-pipeline.stack_outputs
}
output "docs-waf-pipeline_stack_tags" {
  value = module.docs-waf-pipeline.stack_tags
}

output "gds_org_id" {
  value = data.aws_organizations_organization.gds.id
}
