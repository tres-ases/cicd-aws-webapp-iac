terraform {
  backend "remote" {
    organization = "cosmos-demo-${var.stage}"

    workspaces {
      name = "cosmos-demo-${var.stage}"
    }
  }
}

provider "aws" {
  region = var.region
}