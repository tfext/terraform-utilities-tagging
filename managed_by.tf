//
//  Helper variable for tagging resources with the terraform
//  module that they're managed by
//
locals {
  this_dir = dirname(abspath(path.module))
  repo_root = regex(".*\\/terraform\\/", local.this_dir)
  source_rel_dir = trimprefix(abspath(path.root), local.repo_root)
  managed_by = "terraform: ${local.source_rel_dir}"
  managed_by_tags = { managed_by = local.managed_by }
}
