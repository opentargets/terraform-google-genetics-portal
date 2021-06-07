// --- DEBUG --- //
output "gcp_available_regions" {
  value = data.google_compute_regions.gcp_available_regions
}