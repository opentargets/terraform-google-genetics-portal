// --- DEBUG --- //
output "gcp_available_regions" {
  value = data.google_compute_regions.gcp_available_regions
}
output "gcp_available_zones_per_region" {
  value = local.gcp_available_zones_per_region
}

output "subnet_indexing" {
  value = local.vpc_subnet_index
}

output "subnetting_per_deployment_region" {
  value = local.vpc_network_region_subnet_map
}
