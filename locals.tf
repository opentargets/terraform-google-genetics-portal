// --- Helper Information --- //
locals {
  // Helpers --- //
  gcp_available_region_names_sorted = sort(data.google_compute_regions.gcp_available_regions.names)
  gcp_available_zones_per_region = zipmap(
    local.gcp_available_region_names_sorted,
    [for region_details in data.google_compute_zones.gcp_available_zones : region_details.names]
  )

  // Networking --- // 
  vpc_network_name             = "${var.config_release_name}-vpc"
  vpc_network_main_subnet_name = "main-subnet"
  vpc_network_region_subnet_map = zipmap(
    var.config_deployment_regions,
    [
      for region in var.config_deployment_regions : {
        subnet_name   = local.vpc_network_main_subnet_name
        subnet_region = region
        subnet_ip     = "10.${local.vpc_subnet_index[region]}.0.0/20"
      }
    ]
  )
  vpc_subnet_index = zipmap(
    local.gcp_available_region_names_sorted,
    range(0, length(local.gcp_available_region_names_sorted))
  )

  // Firewall --- //
  // Target Tags
  fw_tag_ssh   = "ssh"
  fw_tag_http  = "http"
  fw_tag_https = "https"
}

