// Clickhouse Deployment for Open Target Platform
/*
    This module defines a regional Clickhouse deployment behind an ILB
*/

// Entropy source --- //
resource "random_string" "random_ch_vm" {
  length = 8
  lower = true
  upper = false
  special = false
  keepers = {
    clickhouse_template_tags = join("", sort(local.clickhouse_template_tags)),
    clickhouse_template_machine_type = local.clickhouse_template_machine_type,
    clickhouse_template_source_image = local.clickhouse_template_source_image
  }
}

// Service Account --- //
resource "google_service_account" "gcp_service_acc_apis" {
    project = var.project_id
  account_id = "${var.module_wide_prefix_scope}-svc-${random_string.random_ch_vm.result}"
  display_name = "${var.module_wide_prefix_scope}-GCP-service-account"
}

