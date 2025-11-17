terraform {
  cloud {
    organization = "test-poc-kyndryl"
    workspaces {
      name = "test-poc-kyndryl"
    }
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "google" {
  project     = var.project
  region      = "europe-west4"
  credentials = var.gcp_credentials
}

resource "random_id" "suffix" {
  byte_length = 4
}

resource "google_storage_bucket" "poc_bucket" {
  name     = "poc-test-bucket-${random_id.suffix.hex}"
  location = "europe-west4"
}
#
