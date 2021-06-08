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

