// Open Targets Genetics Portal Deployment Input Parameters
// --- RELEASE INFORMATION --- //
variable "config_release_name" {
  description = "Deployment name used for scoping of resources created. It should have a useful meaning for easy spotting of resources in the GCP Project."
  type        = string
}

// --- DEPLOYMENT CONFIGURATION --- //
variable "config_gcp_default_region" {
  description = "Default deployment region to use when not specified"
  type        = string
}

variable "config_gcp_default_zone" {
  description = "Default zone to use when not specified"
  type        = string
}

variable "config_project_id" {
  description = "Default project to use when not specified"
  type        = string
}

variable "config_deployment_regions" {
  description = "A list of regions where to deploy the OT Platform"
  type        = list(string)
}

// --- Platform Configuration --- //

// --- Development / Debugging Support --- //
variable "config_enable_inspection" {
  description = "If 'true', it will deploy additional VMs for infrastructure inspection, default 'false'"
  default = false
  type = boolean
}

// Inspection VM config --- //
variable "config_inspection_vm_machine_type" {
  description = "Machine type to use for inspection VM instances, default 'n1-standard-1'"
  default = "n1-standard-1"
  type = string
}

variable "config_inspection_vm_image" {
  description = "Disk image to use for booting up the inspection VMs, default 'debian-cloud/debian-10'"
  default = "debian-cloud/debian-10"
  type = string
}