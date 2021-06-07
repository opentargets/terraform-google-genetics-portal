// --- Open Targets Genetics Portal Infrastructure      --- //
//  Author: Manuel Bernal Llinares <mbdebian@gmail.com> --- //

// Providers --- //
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.70.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "3.70.0"
    }
  }
}

provider "google" {
  region  = var.config_gcp_default_region
  project = var.config_project_id
}

provider "google-beta" {
  region  = var.config_gcp_default_region
  project = var.config_project_id
}