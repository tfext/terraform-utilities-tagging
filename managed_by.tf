//
//  Helper variable for tagging resources with the terraform
//  module that they're managed by
//
//  The repository root is the nearest `terraform/` directory above this
//  module, or the tfext meta-repo's root when the root module is inside
//  it (a module being validated or tested there)
//
locals {
  this_dir = dirname(abspath(path.module))
  // Terragrunt runs the root module from a copy under .terragrunt-cache
  root_dir = replace(abspath(path.root), "/\\/\\.terragrunt-cache\\/.*$/", "")
  root_parts = split("/", local.root_dir)

  // The root module's parent, grandparent and great-grandparent, nearest first
  ancestors = [
    for i in range(1, 4) : join("/", slice(local.root_parts, 0, length(local.root_parts) - i))
    if length(local.root_parts) > i + 1
  ]

  // The meta-repo's root holds .gitmodules and this module's checkout
  meta_repo_roots = [
    for dir in local.ancestors : "${dir}/"
    if fileexists("${dir}/.gitmodules") && fileexists("${dir}/utilities-tagging/managed_by.tf")
  ]

  repo_root = try(local.meta_repo_roots[0], regex(".*\\/terraform\\/", local.this_dir))
  source_rel_dir = trimprefix(local.root_dir, local.repo_root)
  managed_by = "terraform: ${local.source_rel_dir}"
  managed_by_tags = { managed_by = local.managed_by }
}
