provider "google" {
  credentials = var.google_credentials
  project     = var.project_id
  region      = var.region
}

module "gce-container" {
  source = "terraform-google-modules/container-vm/google"
  version = "~> 2.0"

  container = {
    image = var.docker_image
    env = [
      {
        name  = "TELEGRAM_TOKEN"
        value = var.telegram_token
      },
      {
        name  = "YOUTUBE_CHANNEL_ID"
        value = var.youtube_channel_id
      },
      {
        name  = "MESSAGE_PREFIX"
        value = var.message_prefix
      },
      {
        name  = "TELEGRAM_CHAT_IDS"
        value = var.telegram_chat_ids
      },
    ]
  }

  restart_policy = "Always"
}

resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = "f1-micro"
  zone         = var.availability_zone

  boot_disk {
    initialize_params {
      image = "projects/cos-cloud/global/images/cos-81-12871-181-0"
    }
  }

  metadata = {
    gce-container-declaration = module.gce-container.metadata_value
    google-logging-enabled    = "false"
    google-monitoring-enabled = "false"
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}
