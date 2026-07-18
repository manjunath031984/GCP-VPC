terraform {
  required_version = "~> 1.15.0"

  backend "gcs" {
    bucket = "gcp-dev-july-2026-terraform-state"
    prefix = "GCP-VPC"
  }

  required_providers {
    google = {
      source = "hashicorp/google"
      # Version intentionally left unpinned to always install the latest stable release.
    }
  }
}
