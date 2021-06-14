// --- API Nodes Internal Load Balancer definition --- //
module "ilb_api" {
    count = length(var.deployment_regions)

  source       = "GoogleCloudPlatform/lb-internal/google"
  version      = "~> 2.0"

  depends_on = [
      google_compute_region_instance_group_manager.regmig_clickhouse
    ]

  project = var.project_id
  region       = var.deployment_regions[count.index]
  name         = "${var.module_wide_prefix_scope}-ilb-${md5(var.deployment_regions[count.index])}"
  ports        = [
    local.api_port
  ]
  source_tags  = []
  target_tags  = [local.fw_tag_api_node]
  create_backend_firewall = false
  network = var.network_name
  subnetwork = var.network_subnet_name
  health_check = {
    type                = "tcp"
    check_interval_sec  = 1
    healthy_threshold   = 4
    timeout_sec         = 1
    unhealthy_threshold = 5
    request             = ""
    response            = ""
    proxy_header        = "NONE"
    port                = local.api_port
    port_name           = local.api_port_name
    request_path        = "/"
    // WTF is this? Amazing documentation 
    host                = "1.2.3.4"
  }
  backends     = [
    {
        group = google_compute_region_instance_group_manager.regmig_api.instance_group,
        description = "API regional instance group for '${var.deployment_regions[count.index]}'"
        },
  ]
}