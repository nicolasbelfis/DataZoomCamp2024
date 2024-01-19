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
  project                     = "sanguine-fusion-410917"
  region                      = "europe-southwest1-a"
  impersonate_service_account = "terraform-runner@sanguine-fusion-410917.iam.gserviceaccount.com"
}

resource "google_storage_bucket" "auto-expire" {
  name          = "auto-expiring-bucket-sanguine-fusion-410917"
  location      = "EU"
  force_destroy = true

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
