// Open Targets Genetics Portal Deployment Input Parameters
// --- RELEASE INFORMATION --- //
variable "config_release_name" {
  description = "Deployment name used for scoping of resources created. It should have a useful meaning for easy spotting of resources in the GCP Project."
  type = string
}

// --- DEPLOYMENT CONFIGURATION --- //
variable "config_gcp_default_region" {
  description = "Default deployment region to use when not specified"
  type = string
}

variable "config_gcp_default_zone" {
  description = "Default zone to use when not specified"
  type = string
}

variable "config_project_id" {
  description = "Default project to use when not specified"
  type = string
}

variable "config_deployment_regions" {
  description = "A list of regions where to deploy the OT Platform"
  type = list(string)
}

// --- Platform Configuration --- //