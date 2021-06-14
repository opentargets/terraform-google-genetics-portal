// --- Firewall Configuration --- //
module "firewall_rules" {
  source = "terraform-google-modules/network/google//modules/firewall-rules"

  project_id   = var.project_id
  network_name = var.network_name

  // Keep in mind that logging is disabled for the defined firewall rules
  rules = [
    // Traffic to the API nodes --- //
    {
      name        = "${var.network_name}-${var.deployment_region}-allow-api-requests"
      description = "Allow API INBOUND traffic"
      direction   = "INGRESS"
      ranges      = var.network_source_ranges
      target_tags = [ local.fw_tag_api_node ]
      allow = [{
        protocol = "tcp"
        ports    = [ local.api_port ]
      }]
      deny                    = []
      priority                = null
      source_tags             = null
      source_service_accounts = null
      target_service_accounts = null
      log_config              = null
    },
    // Health Checks - //
    {
      name        = "${var.network_name}-${var.deployment_region}-allow-api-healthchecks"
      description = "Firewall rule for allowing Health Checks traffic to API Nodes"
      direction   = "INGRESS"
      ranges      = concat(var.network_source_ranges, var.network_sources_health_checks)
      target_tags = [ local.fw_tag_api_node ]
      allow = [{
        protocol = "tcp"
        ports    = [ local.api_port ]
      }]
      deny                    = []
      priority                = null
      source_tags             = null
      source_service_accounts = null
      target_service_accounts = null
      log_config              = null
    }
  ]
}
