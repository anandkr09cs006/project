provider "google" {
# Please put SA accout JSON Key file in place of XXXX
  credentials = "${file("XXXXXXXXXXXXXXXX")}"
  project = "[Your_Project_Name]"//proj name 
  region  = "us-central1"
  zone    = "us-central1-c"
}
resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
 network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}
