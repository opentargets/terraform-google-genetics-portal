// --- Elastic Search Internal Load Balancer definition --- //
module "ilb-es" {
  source       = "GoogleCloudPlatform/lb-internal/google"
  version      = "~> 2.0"
  region       = var.deployment_region
  name         = "${var.module_wide_prefix_scope}-ilb"
  ports        = [ local.elastic_search_port_requests ]
  source_tags  = []
  target_tags  = [local.fw_tag_elasticsearch_requests]
  health_check = {
    type                = "tcp"
    check_interval_sec  = 1
    healthy_threshold   = 4
    timeout_sec         = 1
    unhealthy_threshold = 5
    request             = ""
    response            = ""
    proxy_header        = "NONE"
    port                = local.elastic_search_port_requests
    port_name           = local.elastic_search_port_requests_name
    request_path        = "/"
    // WTF is this? Amazing documentation 
    host                = "1.2.3.4"
  }
  backends     = [
    {
        group = google_compute_region_instance_group_manager.regmig_elastic_search.instance_group,
        description = "Elastic Search regional instance group for '${var.deployment_region}'"
        },
  ]
}