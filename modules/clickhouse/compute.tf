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

