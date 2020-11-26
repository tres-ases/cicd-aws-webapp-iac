terraform {
  backend "remote" {
    organization = "cosmos-demo"

    workspaces {
      name = "cosmos-demo"
    }
  }
}
credentials "app.terraform.io" {
  token = "AnysN9K0X2nyHQ.atlasv1.uzblW5Bt9C86AsB2rKuTzcSz1xWaj6qCV7sklNjfZ3fhvZRPQVJQiYhSYZJToN9FrVM"
}
provider "aws" {
  region = var.region
}