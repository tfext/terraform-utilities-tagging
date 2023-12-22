locals {
  root_domain = "ddrew.com"
  app_name = "liaisun"
}

output "cidr_block_world" {
  value = "0.0.0.0/0"
}

output "docker_repository_endpoint" {
  value = "nexus.corp.${local.root_domain}:5000"
}

output "timestamp" {
  value = "${formatdate("YYMMDDHHmm", timestamp())}"
}

output "today" {
  value = "${formatdate("YYMMDD", timestamp())}"
}

output "root_domain" {
  value = local.root_domain
}

output "app_name" {
  value = local.app_name
}

output "app_subdomain" {
  value = join("", [local.app_name, local.optional_env_suffix])
}

output "app_domain" {
  value = join("", [local.app_name, local.optional_env_suffix, ".", local.root_domain])
}
