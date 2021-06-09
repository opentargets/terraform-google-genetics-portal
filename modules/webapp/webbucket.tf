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

// --- Website Bucket Definition --- //
module "bucket_webapp" {
  source  = "github.com/mbdebian/terraform-google-static-assets//modules/cloud-storage-static-website"
  project = var.project_id
  // Website and Logs buckets configuration
  website_domain_name = local.bucket_name
  access_log_prefix = local.bucket_logs_prefix
  force_destroy_website = true
  force_destroy_access_logs_bucket = true
  website_location = var.location
  website_storage_class = local.bucket_storage_class
  // Pages configuration
  not_found_page = var.website_not_found_page
  // Access logs configuration
  access_logs_expiration_time_in_days = 30
  // CORS
  enable_cors = true
  cors_origins = [ "*"]
}

// --- Web Application Content Provisioner --- //
resource "null_resource" "webapp_provisioner" {
  depends_on = [ module.bucket_webapp ]
  // Redeployment will be triggered whenever the bucket name changes
  triggers = {
    bucket_name = module.bucket_webapp.website_bucket_name
  }
  provisioner "local-exec" {
    working_dir = var.folder_tmp
    environment = merge({
        working_dir = local.webapp_provisioner_path_working_dir
        url_bundle_download = local.webapp_bundle_provisioner_url_bundle_download
        path_build = local.webapp_bundle_provisioner_path_build
        file_name_devops_context_template = local.webapp_bundle_provisioner_file_name_devops_context_template
        file_name_devops_context_instance = local.webapp_bundle_provisioner_file_name_devops_context_instance
        bucket_webapp_url = "gs://${module.bucket_webapp.website_bucket_name}"
        robots_active_file_name = local.webapp_bundle_provisioner_robots_active_file_name
        robots_profile_src_file_name = local.webapp_bundle_provisioner_robots_profile_src
        robots_profile_name = var.webapp_robots_profile
        data_context_url = local.webapp_bundle_provisioner_url_bucket_data_context
        data_context_dst_folder = local.webapp_bundle_provisioner_data_context_dst_folder
        deployment_bundle_filename = local.webapp_deployment_bundle_filename
      },
      local.webapp_provisioner_deployment_context
    )
    command = "/bin/bash ${local.webapp_bundle_provisioner_path_script}"
  }
}
