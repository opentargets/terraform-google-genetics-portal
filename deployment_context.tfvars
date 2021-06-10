// --- DEVELOPMENT - Deployment Context --- //
// --- Release Information --- //
config_release_name = "mbdevgen"

// --- Deployment Configuration --- //
config_gcp_default_region = "europe-west1"
config_gcp_default_zone   = "europe-west1-b"
config_project_id         = "open-targets-eu-dev"
config_deployment_regions = ["europe-west1"]

// TODO --- DNS configuration               --- //
// TODO --- Elastic Search configuration    --- //
// TODO --- Clickhouse configuration        --- //
// TODO --- API configuration               --- //

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