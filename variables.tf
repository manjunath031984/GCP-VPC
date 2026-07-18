variable "project_id" {
  description = "GCP project ID where resources are deployed."
  type        = string
}

variable "service_account_email" {
  description = "Service account attached to the VM instance."
  type        = string
}

variable "region" {
  description = "Primary GCP region."
  type        = string
}

variable "zone" {
  description = "Primary GCP zone."
  type        = string
}

variable "vpc_name" {
  description = "Custom VPC name."
  type        = string
}

variable "vpc_cidr" {
  description = "Address planning CIDR block for the VPC (GCP VPC itself is CIDR-less)."
  type        = string
}

variable "public_subnet_name" {
  description = "Public subnet name."
  type        = string
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR block."
  type        = string
}

variable "firewall_source_ranges" {
  description = "Source CIDRs allowed to reach firewall rules."
  type        = list(string)
}

variable "firewall_target_tags" {
  description = "Network tags targeted by firewall rules."
  type        = list(string)
}

variable "vm_name" {
  description = "Compute Engine VM name."
  type        = string
}

variable "machine_type" {
  description = "Compute Engine machine type."
  type        = string
}

variable "boot_disk_size_gb" {
  description = "Boot disk size in GB."
  type        = number
}

variable "boot_disk_type" {
  description = "Boot disk type."
  type        = string
}

variable "network_tags" {
  description = "Additional network tags for the VM."
  type        = list(string)
}

variable "labels" {
  description = "Common labels applied to supported resources."
  type        = map(string)
}
