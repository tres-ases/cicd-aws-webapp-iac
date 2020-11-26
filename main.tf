terraform {
  backend "remote" {
    organization = "cosmos-demo"

    workspaces {
      name = "cosmos-demo"
    }
  }
}
provider "aws" {
  region = var.region
}