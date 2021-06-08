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
  // Bundle Based provisioner --- //
  webapp_bundle_provisioner_path_script = abspath("${path.module}/scripts/bucket_webapp_bundle_provisioner.sh")
  webapp_bundle_provisioner_url_bundle_download = "https://github.com/${local.webapp_provisioner_repo_name}/releases/download/${var.webapp_release}/bundle.tgz"
  webapp_bundle_provisioner_path_build = "${local.webapp_provisioner_path_working_dir}/build"
  webapp_bundle_provisioner_file_name_devops_context_template = "config.template"
  webapp_bundle_provisioner_file_name_devops_context_instance = "config.js"
  webapp_bundle_provisioner_robots_active_file_name = "robots.txt"
  webapp_bundle_provisioner_robots_profile_default = "default"
  webapp_bundle_provisioner_robots_profile_src = var.webapp_robots_profile != local.webapp_bundle_provisioner_robots_profile_default ? "${local.webapp_bundle_provisioner_robots_active_file_name}.${var.webapp_robots_profile}" : local.webapp_bundle_provisioner_robots_active_file_name
  webapp_bundle_provisioner_url_bucket_data_context = "gs://${var.webapp_bucket_data_context_name}/${var.webapp_bucket_data_context_release}/${var.webapp_bucket_data_context_subfolder_name}"
  webapp_bundle_provisioner_data_context_dst_folder = "data"

  // --- Web Servers --- //
  // Communication Ports
  webapp_webserver_port = 8080
  webapp_webserver_port_name = "webappserverport"
  // Firewall
  fw_tag_webserver_node = "webappservernode"
}
