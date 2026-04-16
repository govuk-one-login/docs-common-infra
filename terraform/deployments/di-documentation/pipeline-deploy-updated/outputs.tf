# ============================================================================
# TGW Cross-Account Role Outputs
# ============================================================================

output "tgw_cross_account_role_arn" {
  description = "ARN of the TGW cross-account role"
  value       = module.tgw-cross-account-role.stack_outputs["RoleArn"]
}

output "tgw_cross_account_role_name" {
  description = "Name of the TGW cross-account role"
  value       = module.tgw-cross-account-role.stack_outputs["RoleName"]
}

output "tgw_cross_account_role_stack_id" {
  description = "CloudFormation stack ID for TGW cross-account role"
  value       = module.tgw-cross-account-role.stack_id
}

# ============================================================================
# Account Information
# ============================================================================

output "account_id" {
  description = "AWS Account ID"
  value       = local.account_id
}

output "gds_org_id" {
  description = "GDS Organization ID"
  value       = data.aws_organizations_organization.gds.id
}

# ============================================================================
# Future: Spoke VPC Outputs (when migrating)
# ============================================================================
/*
output "spoke_vpc_id" {
  description = "Spoke VPC ID"
  value       = module.spoke-vpc.stack_outputs["VpcId"]
}

output "spoke_vpc_cidr" {
  description = "Spoke VPC CIDR"
  value       = module.spoke-vpc.stack_outputs["VpcCidr"]
}
*/
