output "vpc_name" {
  description = "VPC name."
  value       = module.network.vpc_name
}

output "vpc_id" {
  description = "VPC resource ID."
  value       = module.network.vpc_id
}

output "subnet_name" {
  description = "Subnet name."
  value       = module.network.subnet_name
}

output "subnet_cidr" {
  description = "Subnet CIDR block."
  value       = module.network.subnet_cidr
}

output "vm_name" {
  description = "VM name."
  value       = module.compute.vm_name
}

output "vm_id" {
  description = "VM resource ID."
  value       = module.compute.vm_id
}

output "internal_ip" {
  description = "VM internal IP address."
  value       = module.compute.internal_ip
}

output "external_ip" {
  description = "VM external public IP address."
  value       = module.compute.external_ip
}

output "self_link" {
  description = "VM self link."
  value       = module.compute.self_link
}

output "network_name" {
  description = "Network name (same as VPC name)."
  value       = module.network.network_name
}
