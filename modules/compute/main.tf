# Resolve the latest Ubuntu 26.04 LTS Minimal image from Ubuntu public project.
data "google_compute_image" "ubuntu_minimal_2604" {
  project = "ubuntu-os-cloud"
  family  = "ubuntu-minimal-2604-lts"
}

locals {
  instance_metadata = {
    enable-oslogin             = var.os_login_enabled ? "TRUE" : "FALSE"
    serial-port-enable         = var.serial_port_enabled ? "TRUE" : "FALSE"
    serial-port-logging-enable = var.serial_port_logging_enabled ? "true" : "false"
  }
}

# Compute Engine VM with public IP and startup automation.
resource "google_compute_instance" "vm" {
  project      = var.project_id
  name         = var.vm_name
  zone         = var.zone
  machine_type = var.machine_type
  tags         = var.network_tags
  labels       = var.labels

  boot_disk {
    initialize_params {
      image = data.google_compute_image.ubuntu_minimal_2604.self_link
      size  = var.boot_disk_size_gb
      type  = var.boot_disk_type
    }
    auto_delete = true
  }

  network_interface {
    subnetwork = var.subnetwork_self_link

    # Ephemeral external public IP.
    access_config {}
  }

  metadata                  = local.instance_metadata
  metadata_startup_script   = var.startup_script
  allow_stopping_for_update = true

  # Use the required project service account on the VM.
  service_account {
    email = var.service_account_email
    scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
