output "managed_by" {
  value = local.managed_by
}

output "managed_by_description" {
  value = "Managed by ${local.managed_by}"
}

output "managed_by_tags" {
  value = local.managed_by_tags
}

output "default_tags" {
  value = merge(
    local.env_tags,
    local.managed_by_tags
  )
}

output "environment" {
  value       = local.current_env.name
  description = "Current environment name based on terraform workspace"
}

output "short_env" {
  value       = local.current_env.short
  description = "Returns abbreviated environment name"
}

output "environment_suffix" {
  value       = local.optional_env_suffix
  description = "Returns an environment suffix for resource names"
}

output "environment_suffix_x" {
  value       = local.current_env_suffix
  description = "Same as environment_suffix but returns a production suffix as well"
}

output "environment_suffix_u" {
  value       = local.optional_env_suffix_u
  description = "Same as environment_suffix but with underscore delimiter"
}

output "environment_suffix_xu" {
  value       = local.current_env_suffix_u
  description = "Same as environment_suffix_u but returns production suffix as well"
}

output "production" {
  value       = local.is_production
  description = "Returns true if production"
}

output "staging" {
  value       = terraform.workspace == "staging"
  description = "Returns true if staging"
}

output "development" {
  value       = terraform.workspace == "development"
  description = "Returns true if development"
}

output "environment_tags" {
  value = local.env_tags
}
