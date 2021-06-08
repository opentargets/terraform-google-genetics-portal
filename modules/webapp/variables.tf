// --- Web Application Module Input Parameters --- //
// General Deployment Information --- //
variable "module_wide_prefix_scope" {
  description = "Scoping prefix for naming resources in this deployment, default 'mbdevgenwebapp'"
  type = string
  default = "mbdevgenwebapp"
}

variable "project_id" {
  description = "Project ID where resources will be deployed"
  type = string
}

variable "bucket_location" {
  description = "This input value sets the bucket's location. Multi-Region or Regional buckets location values are supported, see https://cloud.google.com/storage/docs/locations#location-mr for more information. By default, the bucket is regional, location 'EUROPE-WEST4'"
  type = string
  default = "EUROPE-WEST4"
}

// --- Web APP Configuration --- //
// Vanilla Bundle Information --- //
variable "webapp_repo_name" {
  description = "Web Application repository name"
  type = string
}

variable "webapp_release" {
  description = "Release version of the web application to deploy"
  type = string
}
// Operational Context --- //
variable "webapp_deployment_context" {
  description = "Values for parameterising the deployment of the web application, see defaults as an example"
  type = any
  default = {
    DEVOPS_CONTEXT_GENETICS_CONFIG_EXAMPLE = "undefined"
  }
}
// Robots Profile --- //
variable "webapp_robots_profile" {
  description = "This defines which 'robots.txt' profile to deploy with the web application, default is 'default', which means no changes will be made to the main 'robots.txt' file set in the web application bundle"
  type = string
  default = "default"
}
// Data Context --- //
variable "webapp_bucket_data_context_name" {
  description = "Bucket name where to find the web application data context"
  type = string
}

variable "webapp_bucket_data_context_release" {
  description = "Web application data context release to use for deployment"
  type = string
}

variable "webapp_bucket_data_context_subfolder_name" {
  description = "Name of the subfolder within the data context release where to find the data static assets"
  type = string
  default = "webapp"
}
// TODO Remove this in the next iteration, where the bucket is created in a different way
variable "website_not_found_page" {
  description = "It defines the website 'not found' page, default 'index.html', this no longer needs to be setup, because the bucket will not be serving the web application"
  type = string
  default = "index.html"
}

// --- Web Servers Configuration --- //
// Networking --- //
variable "network_name" {
  description = "Name of the network where resources should be connected to, default 'default'"
  type = string
  default = "default"
}

variable "network_self_link" {
  description = "Self link to the network where resources should be connected when deployed"
  type = string
  default = "default"
}

variable "network_subnet_name" {
  description = "Name of the subnet, within the 'network_name', and the given region, where instances should be connected to, default 'main-subnet'"
  type = string
  default = "main-subnet"
}

variable "network_source_ranges_map" {
  description = "CIDR that represents which IPs we want to grant access to the deployed resources"
  type = any
/*[
    region = {
      subnet_ip = "CIDR"
    }
  ]
 */
}

variable "network_sources_health_checks" {
  description = "Source CIDR for health checks, default '[ 130.211.0.0/22, 35.191.0.0/16 ]'"
  default = [
    "130.211.0.0/22",
    "35.191.0.0/16"
  ]
}
