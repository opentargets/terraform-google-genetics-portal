// --- Helper Information --- //
locals {
 subnet_index = zipmap(
     sort(data.google_compute_regions.gcp_available_regions.names),
     range(0, length(data.google_compute_regions.gcp_available_regions.names))
 ) 
}