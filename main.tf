terraform {
  cloud {
    organization = "poc-kyndryl"
    workspaces {
      name = "poc-kyndryl-workspace"
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
  name          = "my-poc-bucket"
  location      = "europe-west4"

  iam_configuration {
    uniform_bucket_level_access = true
  }

  # optional, but common:
  # force_destroy = true
}
#
