locals {
  # Merge baseline operational labels with user-defined labels.
  common_labels = merge(
    {
      environment = "dev"
      managed_by  = "terraform"
      stack       = "gcp-vpc"
    },
    var.labels
  )

  vm_effective_tags = distinct(concat(var.firewall_target_tags, var.network_tags))
}

# Network module provisions VPC, subnet, and ingress firewall rules.
module "network" {
  source = "./modules/network"

  project_id             = var.project_id
  region                 = var.region
  vpc_name               = var.vpc_name
  vpc_cidr               = var.vpc_cidr
  public_subnet_name     = var.public_subnet_name
  public_subnet_cidr     = var.public_subnet_cidr
  firewall_source_ranges = var.firewall_source_ranges
  firewall_target_tags   = var.firewall_target_tags
  labels                 = local.common_labels
}

# Compute module provisions the VM and attaches startup script.
module "compute" {
  source = "./modules/compute"

  project_id                  = var.project_id
  zone                        = var.zone
  vm_name                     = var.vm_name
  machine_type                = var.machine_type
  boot_disk_size_gb           = var.boot_disk_size_gb
  boot_disk_type              = var.boot_disk_type
  service_account_email       = var.service_account_email
  subnetwork_self_link        = module.network.subnet_self_link
  startup_script              = file("${path.module}/startup.sh")
  network_tags                = local.vm_effective_tags
  labels                      = local.common_labels
  os_login_enabled            = true
  serial_port_enabled         = true
  serial_port_logging_enabled = true
}
