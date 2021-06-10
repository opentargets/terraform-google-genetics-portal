// --- Open Targets Genetics Portal Infrastructure      --- //
//  Author: Manuel Bernal Llinares <mbdebian@gmail.com> --- //

// --- Provider Configuration --- //
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.70.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "3.70.0"
    }
  }
}

provider "google" {
  region  = var.config_gcp_default_region
  project = var.config_project_id
}

provider "google-beta" {
  region  = var.config_gcp_default_region
  project = var.config_project_id
}

// Availability Regions --- //
data "google_compute_regions" "gcp_available_regions" {
  project = var.config_project_id
}

// Availability Zones --- //
data "google_compute_zones" "gcp_available_zones" {
  count   = length(local.gcp_available_region_names_sorted)
  project = var.config_project_id

  region = local.gcp_available_region_names_sorted[count.index]
}

// [--- Components ---] //
// --- Elastic Search --- //
// TODO
// --- Clickhouse --- //
// TODO
// --- API --- //
// TODO
// --- Web Application --- //
module "web_app" {
  source     = "./modules/webapp"
  project_id = var.config_project_id
  depends_on = [
    module.vpc_network
  ]
  gcp_available_region_names = local.gcp_available_region_names_sorted
  module_wide_prefix_scope           = "${var.config_release_name}-web"
  folder_tmp                         = local.folder_tmp
  webapp_bucket_location             = var.config_webapp_bucket_location
  webapp_repo_name                   = var.config_webapp_repo_name
  webapp_release                     = var.config_webapp_release
  webapp_deployment_context          = var.config_webapp_deployment_context_map
  webapp_robots_profile              = var.config_webapp_robots_profile
  webapp_bucket_data_context_name    = var.config_webapp_bucket_name_data_assets
  webapp_bucket_data_context_release = var.config_webapp_data_context_release
  // Web Servers Configuration --- //
  network_name        = module.vpc_network.network_name
  network_self_link   = module.vpc_network.network_self_link
  network_subnet_name = local.vpc_network_main_subnet_name
  network_source_ranges_map = zipmap(
    var.config_deployment_regions,
    [
      for region in var.config_deployment_regions : {
        source_range = local.vpc_network_region_subnet_map[region].subnet_ip
      }
    ]
  )
  //network_sources_health_checks = DEFAULT
  webserver_deployment_regions   = var.config_deployment_regions
  webserver_firewall_tags        = concat([local.tag_glb_target_node], local.dev_fw_tags)
  webserver_docker_image_version = var.config_webapp_webserver_docker_image_version
  webserver_vm_vcpus             = var.config_webapp_webserver_vm_vcpus
  webserver_vm_mem               = var.config_webapp_webserver_vm_mem
  webserver_vm_image             = var.config_webapp_webserver_vm_image
  webserver_vm_image_project     = var.config_webapp_webserver_vm_image_project
  webserver_vm_boot_disk_size    = var.config_webapp_webserver_vm_boot_disk_size
  deployment_target_size         = 1
}
