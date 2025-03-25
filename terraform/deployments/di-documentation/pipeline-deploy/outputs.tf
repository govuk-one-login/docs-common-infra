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

output "tech-docs-ecr_stack_id" {
  value = module.tech-docs-ecr.stack_id
}
output "tech-docs-ecr_stack_outputs" {
  value = module.tech-docs-ecr.stack_outputs
}
output "tech-docs-ecr_stack_tags" {
  value = module.tech-docs-ecr.stack_tags
}

output "event-catalogue-ecr_stack_id" {
  value = module.event-catalogue-ecr.stack_id
}
output "event-catalogue-ecr_stack_outputs" {
  value = module.event-catalogue-ecr.stack_outputs
}
output "event-catalogue-ecr_stack_tags" {
  value = module.event-catalogue-ecr.stack_tags
}

output "signals-catalogue-ecr_stack_id" {
  value = module.signals-catalogue-ecr.stack_id
}
output "signals-catalogue-ecr_stack_outputs" {
  value = module.signals-catalogue-ecr.stack_outputs
}
output "signals-catalogue-ecr_stack_tags" {
  value = module.signals-catalogue-ecr.stack_tags
}

output "data-radar-ecr_stack_id" {
  value = module.data-radar-ecr.stack_id
}
output "data-radar-ecr_stack_outputs" {
  value = module.data-radar-ecr.stack_outputs
}
output "data-radar-ecr_stack_tags" {
  value = module.data-radar-ecr.stack_tags
}

output "wallet-docs-ecr_stack_id" {
  value = module.wallet-docs-ecr.stack_id
}
output "wallet-docs-ecr_stack_outputs" {
  value = module.wallet-docs-ecr.stack_outputs
}
output "wallet-docs-ecr_stack_tags" {
  value = module.wallet-docs-ecr.stack_tags
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

output "tech-docs-pipeline_stack_id" {
  value = module.tech-docs-pipeline.stack_id
}
output "tech-docs-pipeline_stack_outputs" {
  value = module.tech-docs-pipeline.stack_outputs
}
output "tech-docs-pipeline_stack_tags" {
  value = module.tech-docs-pipeline.stack_tags
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

output "event-catalogue-pipeline_stack_id" {
  value = module.event-catalogue-pipeline.stack_id
}
output "event-catalogue-pipeline_stack_outputs" {
  value = module.event-catalogue-pipeline.stack_outputs
}
output "event-catalogue-pipeline_stack_tags" {
  value = module.event-catalogue-pipeline.stack_tags
}

output "signals-catalogue-pipeline_stack_id" {
  value = module.signals-catalogue-pipeline.stack_id
}
output "signals-catalogue-pipeline_stack_outputs" {
  value = module.signals-catalogue-pipeline.stack_outputs
}
output "signals-catalogue-pipeline_stack_tags" {
  value = module.signals-catalogue-pipeline.stack_tags
}

output "data-radar-pipeline_stack_id" {
  value = module.data-radar-pipeline.stack_id
}
output "data-radar-pipeline_stack_outputs" {
  value = module.data-radar-pipeline.stack_outputs
}
output "data-radar-pipeline_stack_tags" {
  value = module.data-radar-pipeline.stack_tags
}

output "wallet-docs-pipeline_stack_id" {
  value = module.wallet-docs-pipeline.stack_id
}
output "wallet-docs-pipeline_stack_outputs" {
  value = module.wallet-docs-pipeline.stack_outputs
}
output "wallet-docs-pipeline_stack_tags" {
  value = module.wallet-docs-pipeline.stack_tags
}

output "gds_org_id" {
  value = data.aws_organizations_organization.gds.id
}
