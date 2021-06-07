// --- Open Targets Genetics Portal Infrastructure      --- //
//  Author: Manuel Bernal Llinares <mbdebian@gmail.com> --- //

// --- Provider Configuration --- //
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

// Availability Regions --- //
data "google_compute_regions" "gcp_available_regions" {
}

// Availability Zones --- //
data "google_compute_zones" "gcp_available_zones" {
    count = length(local.gcp_available_region_names_sorted)

    region = local.gcp_available_region_names_sorted[count.index]
}

// [--- Components ---] //
// --- Elastic Search --- //
// TODO
// --- Clickhouse --- //
// TODO
// --- API --- //
// TODO
// --- Web Application --- //
// TODO