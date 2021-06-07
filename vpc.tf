// --- VPC --- //
// Default Network Tier --- //
resource "google_compute_project_default_network_tier" "default_network_tier" {
  network_tier = "PREMIUM"
  project      = var.config_project_id
}

// VPC with Custom Subnetting --- //
module "vpc_network" {
  source  = "terraform-google-modules/network/google"
  version = "~> 3.0"

  project_id = var.config_project_id
  network_name = local.vpc_network_name
  routing_mode = "REGIONAL"
  auto_create_subnetworks = false

  subnets = [
    for region in var.config_deployment_regions: local.vpc_network_region_subnet_map[region]
  ]
}

