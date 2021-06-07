// --- DEBUG --- //
output "gcp_available_regions" {
  value = data.google_compute_regions.gcp_available_regions
}

output "subnet_indexing" {
  value = local.subnet_index
}