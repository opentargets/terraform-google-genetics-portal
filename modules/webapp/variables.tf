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
