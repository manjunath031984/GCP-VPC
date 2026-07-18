variable "project_id" {
  description = "GCP project ID."
  type        = string
}

variable "region" {
  description = "Region for subnet deployment."
  type        = string
}

variable "vpc_name" {
  description = "Custom VPC name."
  type        = string
}

variable "vpc_cidr" {
  description = "Address planning CIDR for VPC documentation."
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
  description = "Allowed ingress source ranges."
  type        = list(string)
}

variable "firewall_target_tags" {
  description = "Target tags for firewall rules."
  type        = list(string)
}

variable "labels" {
  description = "Labels applied to resources that support labels."
  type        = map(string)
}
