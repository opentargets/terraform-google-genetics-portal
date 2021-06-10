// --- Active Web Servers for the web application --- //
// TODOs:
//  - Use a regional index map for fixed indexes on the different regions, to avoid the problem of pulling the first region from the list of deploymebnt regions
//  - 

// Definition of active web servers for the web application
resource "random_string" "random_web_server_suffix" {
  length = 8
  lower = true
  upper = false
  special = false
  keepers = {
    webapp_bucket_name = local.bucket_name
    deployment_bundle_filename = local.webapp_deployment_bundle_filename
    deployment_bundle_url = local.webapp_deployment_bundle_url
    nginx_docker_image_version = var.webserver_docker_image_version
    startup_script = md5(file("${path.module}/scripts/webserver_vm_startup_script.sh"))
  }
}

// Access to Available compute zones in the given region --- //
data "google_compute_zones" "gcp_zones_available" {
  count = length(var.webserver_deployment_regions)
  
  region = var.webserver_deployment_regions[count.index]
}

