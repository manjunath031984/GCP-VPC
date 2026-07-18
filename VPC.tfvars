project_id            = "gcp-dev-july-2026"
service_account_email = "infra-admin@gcp-dev-july-2026.iam.gserviceaccount.com"
region                = "us-central1"
zone                  = "us-central1-a"

vpc_name           = "gcp-vpc"
vpc_cidr           = "192.168.0.0/19"
public_subnet_name = "gcp-public-subnet"
public_subnet_cidr = "192.168.0.0/24"

firewall_source_ranges = ["0.0.0.0/0"]
firewall_target_tags   = ["gcp-vpc-web"]

vm_name           = "gcp-vm-web"
machine_type      = "e2-micro"
boot_disk_size_gb = 10
boot_disk_type    = "pd-standard"
network_tags      = ["http-server", "https-server"]

labels = {
  project = "gcp-vpc"
  owner   = "devops"
}
