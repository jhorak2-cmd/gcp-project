terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = "project-composer-476710"
  region  = "europe-west4"
  credentials = jsondecode(env("GCP_CREDENTIALS"))
}

resource "google_storage_bucket" "poc_bucket" {
  name     = "poc-test-bucket-${random_id.suffix.hex}"
  location = "europe-west4"
}

resource "random_id" "suffix" {
  byte_length = 4
}
