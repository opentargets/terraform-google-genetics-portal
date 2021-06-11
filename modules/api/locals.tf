// --- Helper information --- //
locals {
    gcp_available_region_names_sorted = sort(var.gcp_available_region_names)
  gcp_available_zones_per_region = zipmap(
    local.gcp_available_region_names_sorted,
    [for region_details in data.google_compute_zones.gcp_available_zones : region_details.names]
  )
}