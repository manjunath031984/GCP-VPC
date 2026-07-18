output "vpc_name" {
  description = "VPC name."
  value       = google_compute_network.this.name
}

output "vpc_id" {
  description = "VPC ID."
  value       = google_compute_network.this.id
}

output "vpc_self_link" {
  description = "VPC self link."
  value       = google_compute_network.this.self_link
}

output "subnet_name" {
  description = "Subnet name."
  value       = google_compute_subnetwork.public.name
}

output "subnet_cidr" {
  description = "Subnet CIDR block."
  value       = google_compute_subnetwork.public.ip_cidr_range
}

output "subnet_self_link" {
  description = "Subnet self link."
  value       = google_compute_subnetwork.public.self_link
}

output "network_name" {
  description = "Network name."
  value       = google_compute_network.this.name
}
