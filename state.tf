terraform {
    backend "s3" {
        bucket = "cosmos-tf-up-and-running-state-dev"
        key = "global/dev/s3/terraform_cosmos.tfstate"
        region = "us-west-2"
        dynamodb_table = "cosmos-tf-up-and-running-locks-dev"
    }
}
