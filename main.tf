terraform {
  backend "remote" {
    organization = "cosmos-demo"

    workspaces {
      prefix = "cosmos-demo-"
    }
  }
}

provider "aws" {
  region = var.region
}