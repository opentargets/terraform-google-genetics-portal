// --- Compute resources deployed for supporting development / inspection activities --- //
// Inspection VM --- //
resource "google_compute_instance" "inspection_vm" {
  // This definition will deploy a small VM in each deployment region for debugging communication and other infrastructure issues
  count = length(var.config_deployment_regions) * local.inspection_conditional_deployment

  name = "${var.config_release_name}-inspection-vm-${count.index}"
  machine_type = "e2-small"
  zone = local.gcp_available_zones_per_region[config_deployment_regions[count.index]][0]
  depends_on = [ module.vpc_network ]

  boot_disk {
    initialize_params {
        image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = module.vpc_network.network_self_link
    subnetwork = "main-subnet"
  }

  tags = [ "ssh" ]
}
