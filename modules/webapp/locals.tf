// --- Helper information --- //
locals {
  // --- Bucket Configuration --- //
  multiregional_locations = [
    "ASIA",
    "EU",
    "US"
  ]
  bucket_storage_class = contains(local.multiregional_locations, var.location) ? "MULTI_REGIONAL" : "REGIONAL"
  bucket_name = replace("${var.module_wide_prefix_scope}-${var.webapp_release}-${random_string.random_webbucket.result}", ".", "-")
}
