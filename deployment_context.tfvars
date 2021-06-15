// --- DEVELOPMENT - Deployment Context --- //
// --- Release Information --- //
config_release_name = "mbdevgen"

// --- Deployment Configuration --- //
config_gcp_default_region = "europe-west1"
config_gcp_default_zone   = "europe-west1-b"
config_project_id         = "open-targets-eu-dev"
config_deployment_regions = ["europe-west1"]

// TODO --- DNS configuration               --- //
config_dns_project_id                       = "open-targets-eu-dev"
config_dns_subdomain_prefix                 = "mbdev"
config_dns_managed_zone_name                = "opentargets-xyz"
config_dns_managed_zone_dns_name            = "opentargets.xyz."
config_dns_platform_api_subdomain           = "api"

// --- Elastic Search configuration    --- //
// [XXX WARNING - DEV - USING PLATFORM IMAGE FOR TESTING PROVISIONER" XXX] //
config_vm_elastic_search_image_project  = "open-targets-eu-dev"
config_vm_elastic_search_vcpus          = "4"
config_vm_elastic_search_mem            = "26624"
config_vm_elastic_search_image          = "platform-etl-es-21-04-3"
config_vm_elastic_search_version        = "7.9.0"
config_vm_elastic_search_boot_disk_size = "500GB"

// --- Clickhouse configuration        --- //
// [XXX WARNING - DEV - USING PLATFORM IMAGE FOR TESTING PROVISIONER" XXX] //
config_vm_clickhouse_vcpus                  = "4"
config_vm_clickhouse_mem                    = "26624"
config_vm_clickhouse_image                  = "platform-etl-ch-21-04-3"
config_vm_clickhouse_image_project          = "open-targets-eu-dev"
config_vm_clickhouse_boot_disk_size         = "250GB"

// --- API configuration               --- //
// [XXX WARNING - DEV - USING PLATFORM IMAGE FOR TESTING PROVISIONER" XXX] //
config_vm_api_image_version        = "21.04.5"
config_vm_api_vcpus                         = "2"
config_vm_api_mem                           = "7680"
config_vm_api_image                         = "cos-stable"
config_vm_api_image_project                 = "cos-cloud"
config_vm_api_boot_disk_size                = "10GB"

// --- Web Application configuration   --- //
// [XXX WARNING - DEV - USING PLATFORM APP FOR TESTING PROVISIONER" XXX] //
config_webapp_repo_name = "opentargets/platform-app"
config_webapp_release   = "21.04.2"
config_webapp_deployment_context_map = {
  DEVOPS_CONTEXT_PLATFORM_APP_CONFIG_URL_API      = "'https://api.platform.opentargets.org/api/v4/graphql'"
  DEVOPS_CONTEXT_PLATFORM_APP_CONFIG_URL_API_BETA = "'https://api.platform.opentargets.org/api/v4/graphql'"
}
// Use 'default' robots.txt profile
//config_webapp_robots_profile                = "production"
config_webapp_bucket_name_data_assets        = "open-targets-data-releases"
config_webapp_data_context_release           = "21.04"
config_webapp_webserver_docker_image_version = "1.20"

// --- Development features                 --- //
config_enable_inspection = true
config_enable_ssh        = true