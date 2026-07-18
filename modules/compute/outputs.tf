output "vm_name" {
  description = "VM name."
  value       = google_compute_instance.vm.name
}

output "vm_id" {
  description = "VM ID."
  value       = google_compute_instance.vm.id
}

output "internal_ip" {
  description = "VM internal IP address."
  value       = google_compute_instance.vm.network_interface[0].network_ip
}

output "external_ip" {
  description = "VM external public IP address."
  value       = google_compute_instance.vm.network_interface[0].access_config[0].nat_ip
}

output "self_link" {
  description = "VM self link."
  value       = google_compute_instance.vm.self_link
}
