// This file defines a public (Read-Only) bucket where all the components of the application will be put together for the web server VMs to pull from it when launching

resource "random_string" "random_webbucket" {
  length = 8
  lower = true
  upper = false
  special = false
  keepers = {
    webapp_release = var.webapp_release
    webapp_repository = var.webapp_repo_name
    robots_profile_name = var.webapp_robots_profile
    data_context_url = local.webapp_bundle_provisioner_url_bucket_data_context
    data_context_dst_folder = local.webapp_bundle_provisioner_data_context_dst_folder
    deployment_bundle_filename = local.webapp_deployment_bundle_filename
    deployment_scope = var.module_wide_prefix_scope
    deployment_context = md5(jsonencode(var.webapp_deployment_context))
  }
}