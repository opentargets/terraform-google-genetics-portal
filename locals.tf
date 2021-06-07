// --- Helper Information --- //
locals {
  // Networking --- // 
  vpc_network_name             = "${var.config_release_name}-vpc"
  vpc_subnet_index = zipmap(
    sort(data.google_compute_regions.gcp_available_regions.names),
    range(0, length(data.google_compute_regions.gcp_available_regions.names))
  )
}