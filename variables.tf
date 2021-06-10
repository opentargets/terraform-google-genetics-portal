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
// TODO --- DNS configuration               --- //
// --- Elastic Search configuration    --- //
variable "config_vm_elastic_search_image_project" {
  description = "GCP project hosting the Elastic Search Image."
  type = string
}

variable "config_vm_elastic_search_vcpus" {
  description = "CPU count configuration for the deployed Elastic Search Instances"
  type = number
}

variable "config_vm_elastic_search_mem" {
  description = "RAM configuration for the deployed Elastic Search Instances"
  type = number
}

variable "config_vm_elastic_search_image" {
  description = "Disk image to use for the deployed Elastic Search Instances"
  type = string
}

variable "config_vm_elastic_search_version" {
  description = "Elastic search version to deploy"
  type = string
}

variable "config_vm_elastic_search_boot_disk_size" {
  description = "Boot disk size to use for the deployed Elastic Search Instances"
  type = string
}
// TODO --- Clickhouse configuration        --- //
// TODO --- API configuration               --- //

// --- Web Application configuration   --- //
variable "config_webapp_repo_name" {
  description = "Web Application repository name"
  type        = string
}

variable "config_webapp_release" {
  description = "Release version of the web application to deploy"
  type        = string
}

variable "config_webapp_deployment_context_map" {
  description = "A map with values for those parameters that need to be customized in the deployment of the web application, see module defaults as an example"
  type        = any
}

variable "config_webapp_bucket_location" {
  description = "This input parameter defines the location of the Web Application (bucket), default 'EU'"
  type        = string
  default     = "EU"
}

variable "config_webapp_robots_profile" {
  description = "This input parameter defines the 'robots.txt' profile to be used when deploying the web application, default 'default', which means that no changes to existing 'robots.txt' file will be made"
  type        = string
  default     = "default"
}

variable "config_webapp_bucket_name_data_assets" {
  description = "Bucket where to find the data context for the web application"
  type        = string
}

variable "config_webapp_data_context_release" {
  description = "Data context release for the web application"
  type        = string
}

// Web Application Web Servers --- //
variable "config_webapp_webserver_docker_image_version" {
  description = "NginX Docker image version to use in deployment"
  type        = string
}

variable "config_webapp_webserver_vm_vcpus" {
  description = "CPU count, default '1'"
  type        = number
  default     = "1"
}

variable "config_webapp_webserver_vm_mem" {
  description = "Amount of memory allocated Web Server nodes (MiB), default '3840'"
  type        = number
  default     = "3840"
}

variable "config_webapp_webserver_vm_image" {
  description = "VM image to use for Web Server nodes, default 'cos-stable'"
  type        = string
  default     = "cos-stable"
}

variable "config_webapp_webserver_vm_image_project" {
  description = "Project hosting the VM image, default 'cos-cloud'"
  type        = string
  default     = "cos-cloud"
}

variable "config_webapp_webserver_vm_boot_disk_size" {
  description = "Boot disk size for Web Server nodes, default '10GB'"
  type        = string
  default     = "10GB"
}

// --- Development / Debugging Support --- //
variable "config_enable_inspection" {
  description = "If 'true', it will deploy additional VMs for infrastructure inspection, default 'false'"
  default     = false
}

variable "config_enable_ssh" {
  description = "if 'true' it will enable SSH traffic to all the deployed VMs, default 'false'"
  default     = false
}

// Inspection VM config --- //
variable "config_inspection_vm_machine_type" {
  description = "Machine type to use for inspection VM instances, default 'n1-standard-1'"
  default     = "n1-standard-1"
  type        = string
}

variable "config_inspection_vm_image" {
  description = "Disk image to use for booting up the inspection VMs, default 'debian-cloud/debian-10'"
  default     = "debian-cloud/debian-10"
  type        = string
}