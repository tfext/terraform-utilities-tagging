locals {
  environments = var.environments ? {
    development = { name = "development", short = "dev" }
    staging     = { name = "staging", short = "stg" }
    production  = { name = "production", short = "prd" }
  } : {
    default     = { name = "core", short = "core" }
  }

  is_core              = terraform.workspace == "default"
  is_production        = terraform.workspace == "production"
  use_suffix           = !(local.is_production || local.is_core)
  env_tags             = terraform.workspace == "default" ? {} : { env = terraform.workspace }

  current_env          = local.environments[terraform.workspace]
  current_env_suffix   = "-${local.current_env.short}"
  current_env_suffix_u = "_${local.current_env.short}"

  optional_env_suffix  = local.use_suffix ? local.current_env_suffix : ""
  optional_env_suffix_u = local.use_suffix ? local.current_env_suffix_u : ""
}
