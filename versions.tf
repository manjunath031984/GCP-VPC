terraform {
  required_version = "~> 1.15.0"

  required_providers {
    google = {
      source = "hashicorp/google"
      # Version intentionally left unpinned to always install the latest stable release.
    }
  }
}
