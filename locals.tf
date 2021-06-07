// --- Helper Information --- //
locals {
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
    sort(data.google_compute_regions.gcp_available_regions.names),
    range(0, length(data.google_compute_regions.gcp_available_regions.names))
  )
}