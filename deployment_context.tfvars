// --- DEVELOPMENT - Deployment Context --- //
// --- Release Information --- //
config_release_name = "mbdevgen"

// --- Deployment Configuration --- //
config_gcp_default_region = "europe-west1"
config_gcp_default_zone   = "europe-west1-b"
config_project_id         = "open-targets-eu-dev"
config_deployment_regions = ["europe-west1"]

// TODO --- DNS configuration               --- //
config_dns_project_id            = "open-targets-eu-dev"
config_dns_subdomain_prefix      = "mbdev"
config_dns_managed_zone_name     = "opentargets-xyz"
config_dns_managed_zone_dns_name = "opentargets.xyz."
config_dns_api_subdomain         = "api"

// --- Elastic Search configuration    --- //
config_vm_elastic_search_image_project  = "open-targets-genetics"
config_vm_elastic_search_vcpus          = "4"
config_vm_elastic_search_mem            = "26624"
config_vm_elastic_search_image          = "opentargets-genetics-ch-200201"
config_vm_elastic_search_version        = "7.9.0"
config_vm_elastic_search_boot_disk_size = "500GB"

// --- Clickhouse configuration        --- //
config_vm_clickhouse_vcpus          = "8"
config_vm_clickhouse_mem            = "53248"
config_vm_clickhouse_image          = "opentargets-genetics-ch-200201"
config_vm_clickhouse_image_project  = "open-targets-genetics"
config_vm_clickhouse_boot_disk_size = "500GB"

// --- API configuration               --- //
config_vm_api_image_version  = "20.02.07"
config_vm_api_vcpus          = "2"
config_vm_api_mem            = "7680"
config_vm_api_image          = "cos-stable"
config_vm_api_image_project  = "cos-cloud"
config_vm_api_boot_disk_size = "10GB"

// --- Web Application configuration   --- //
// [XXX WARNING - DEV - USING PLATFORM APP FOR TESTING PROVISIONER" XXX] //
config_webapp_repo_name = "opentargets/genetics-app"
config_webapp_release   = "21.04.4"
config_webapp_deployment_context_map = {
  DEVOPS_CONTEXT_PLATFORM_APP_CONFIG_API_URL      = "'https://api.genetics.mbdev.opentargets.xyz/graphql'"
}
// Use 'default' robots.txt profile
//config_webapp_robots_profile                = "production"
config_webapp_bucket_name_data_assets        = "open-targets-data-releases"
config_webapp_data_context_release           = "21.04"
config_webapp_webserver_docker_image_version = "1.20"

// --- Development features                 --- //
config_enable_inspection = true
config_enable_ssh        = true