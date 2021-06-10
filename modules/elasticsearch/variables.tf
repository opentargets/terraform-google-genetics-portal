// --- Module input parameters --- //
// General deployment input parameters --- //
variable "module_wide_prefix_scope" {
  description = "The prefix provided here will scope names for those resources created by this module, default 'mdevgenes'"
  type = string
  default = "mdevgenes"
}

variable "network_name" {
  description = "Name of the network where resources should be deployed, 'default'"
  type = string
  default = "default"
}

variable "network_self_link" {
  description = "Self link to the network where resources should be connected when deployed"
  type = string
  default = "default"
}

variable "network_subnet_name" {
  description = "Name of the subnet, within the 'network_name', and the given region, where instances should be connected to"
  type = string
  default = "main-subnet"
}

variable "network_source_ranges" {
  description = "CIDR that represents which IPs we want to grant access to the deployed resources, default '10.0.0.0/9'"
  type = list(string)
  default = [ "10.0.0.0/9" ]
}

variable "network_sources_health_checks" {
  description = "Source CIDR for health checks, default '[ 130.211.0.0/22, 35.191.0.0/16 ]'"
  default = [
    "130.211.0.0/22",
    "35.191.0.0/16"
  ]
}

variable "deployment_region" {
  description = "Region where resources should be deployed"
  type = string
}

// --- Elastic Search Instance configuration --- //
variable "deployment_target_size" {
  description = "Initial Elastic Search node count to deploy, default is '1'"
  type = number
  default = 1
}

variable "vm_firewall_tags" {
  description = "Additional tags that should be attached to any Elastic Search Node deployed by this module"
  type = list(string)
  default = [ ]
}
