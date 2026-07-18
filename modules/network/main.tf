# Custom mode VPC network for isolated workload networking.
resource "google_compute_network" "this" {
  project                         = var.project_id
  name                            = var.vpc_name
  auto_create_subnetworks         = false
  routing_mode                    = "REGIONAL"
  delete_default_routes_on_create = false
  description                     = "Custom VPC for workload. Address plan root CIDR: ${var.vpc_cidr}"
}

# Public subnet hosting external-facing workloads.
resource "google_compute_subnetwork" "public" {
  project                  = var.project_id
  name                     = var.public_subnet_name
  region                   = var.region
  network                  = google_compute_network.this.id
  ip_cidr_range            = var.public_subnet_cidr
  private_ip_google_access = true
  description              = "Public subnet in ${var.region}"
}

# Allow inbound SSH for administration.
resource "google_compute_firewall" "allow_ssh" {
  project       = var.project_id
  name          = "${var.vpc_name}-allow-ssh"
  network       = google_compute_network.this.name
  direction     = "INGRESS"
  source_ranges = var.firewall_source_ranges
  target_tags   = var.firewall_target_tags
  priority      = 1000

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

# Allow inbound HTTP for web traffic.
resource "google_compute_firewall" "allow_http" {
  project       = var.project_id
  name          = "${var.vpc_name}-allow-http"
  network       = google_compute_network.this.name
  direction     = "INGRESS"
  source_ranges = var.firewall_source_ranges
  target_tags   = var.firewall_target_tags
  priority      = 1000

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
}

# Allow inbound HTTPS for secure web traffic.
resource "google_compute_firewall" "allow_https" {
  project       = var.project_id
  name          = "${var.vpc_name}-allow-https"
  network       = google_compute_network.this.name
  direction     = "INGRESS"
  source_ranges = var.firewall_source_ranges
  target_tags   = var.firewall_target_tags
  priority      = 1000

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
}

# Allow ICMP for network troubleshooting.
resource "google_compute_firewall" "allow_icmp" {
  project       = var.project_id
  name          = "${var.vpc_name}-allow-icmp"
  network       = google_compute_network.this.name
  direction     = "INGRESS"
  source_ranges = var.firewall_source_ranges
  target_tags   = var.firewall_target_tags
  priority      = 1000

  allow {
    protocol = "icmp"
  }
}
