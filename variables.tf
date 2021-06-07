// Open Targets Genetics Portal Deployment Input Parameters
// --- RELEASE INFORMATION --- //
variable "config_release_name" {
  description = "Deployment name used for scoping of resources created. It should have a useful meaning for easy spotting of resources in the GCP Project."
  type = string
}

