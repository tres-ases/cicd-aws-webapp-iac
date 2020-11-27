terraform {
  backend "remote" {
    organization = "cosmos-demo"

    workspaces {
      name = "cosmos-demo-${var.stage}"
    }
  }
}

provider "aws" {
  region = var.region
}