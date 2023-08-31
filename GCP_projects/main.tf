 terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.74.0"
    }
  }
}

provider "google" {
  credentials = "reliable-realm-393420-b6b9db5ccc40.json"
  project = "reliable-realm-393420"
  region = "us-central1"
  zone = "us-central1-c"
}

resource "google_compute_instance" "vm-instance" {
  name         = "terraform-instance"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  network_interface {
    network = "default"
    access_config { }
  }
}