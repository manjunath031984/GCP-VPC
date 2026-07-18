variable "project_id" {
  description = "GCP project ID."
  type        = string
}

variable "zone" {
  description = "Zone for VM deployment."
  type        = string
}

variable "vm_name" {
  description = "Compute Engine instance name."
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
  description = "Boot disk type (for example, pd-standard)."
  type        = string
}

variable "service_account_email" {
  description = "Service account email attached to the VM."
  type        = string
}

variable "subnetwork_self_link" {
  description = "Subnetwork self link for VM NIC."
  type        = string
}

variable "startup_script" {
  description = "Startup script content."
  type        = string
}

variable "network_tags" {
  description = "Network tags used by firewall targeting."
  type        = list(string)
}

variable "labels" {
  description = "Labels applied to the instance."
  type        = map(string)
}

variable "os_login_enabled" {
  description = "Enable OS Login on the VM."
  type        = bool
}

variable "serial_port_enabled" {
  description = "Enable serial port access."
  type        = bool
}

variable "serial_port_logging_enabled" {
  description = "Enable serial port logging to Cloud Logging."
  type        = bool
}
