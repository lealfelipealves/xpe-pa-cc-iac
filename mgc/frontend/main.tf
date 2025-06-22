terraform {
  required_providers {
    mgc = {
      source  = "magalucloud/mgc"
      version = "0.34.0"
    }
  }

  backend "s3" {}
}

provider "mgc" {
  api_key = var.api_key
  region  = var.region

  object_storage = {
    key_pair = {
      key_id     = var.access_key
      key_secret = var.secret_key
    }
  }
}