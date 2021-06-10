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

