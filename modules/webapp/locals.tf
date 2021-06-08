// --- Helper information --- //
locals {
  // --- Bucket Configuration --- //
  multiregional_locations = [
    "ASIA",
    "EU",
    "US"
  ]
  bucket_storage_class = contains(local.multiregional_locations, var.location) ? "MULTI_REGIONAL" : "REGIONAL"
  bucket_name = replace("${var.module_wide_prefix_scope}-${var.webapp_release}-${random_string.random_webbucket.result}", ".", "-")
  // --- Web App Provisioning --- //
  // Repo name
  webapp_provisioner_repo_name = var.webapp_repo_name
  // Working Dir base path
  //webapp_provisioner_path_working_dir = abspath("${var.folder_tmp}/webapp_${var.webapp_release}")
  webapp_provisioner_path_working_dir = abspath("${var.folder_tmp}/webapp_${local.bucket_name}")
  // Deployment Context
  webapp_provisioner_deployment_context = zipmap(
    keys(var.webapp_deployment_context),
    [for key, value in var.webapp_deployment_context:
      replace(
        value,
        "/",
        "\\/"
      )
    ]
  )
}
