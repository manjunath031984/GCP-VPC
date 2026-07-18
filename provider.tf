# Google provider configuration.
# Credentials are automatically read from GOOGLE_APPLICATION_CREDENTIALS
# which is already exported by the Jenkins pipeline.
provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}
