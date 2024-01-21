terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.12.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "sanguine-fusion-410917"
  region  = "europe-southwest1-a"
  # impersonate_service_account = "terraform-runner@sanguine-fusion-410917.iam.gserviceaccount.com"
}

resource "google_storage_bucket" "auto-expire" {
  name          = var.gcs_storage_name
  location      = var.location
  force_destroy = true
  storage_class = var.gcs_storage_class

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}
