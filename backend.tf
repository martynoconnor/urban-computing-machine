terraform {
  required_version = ">= 0.12.2"

  backend "s3" {
    region         = "ap-southeast-2"
    bucket         = "egadsthefuzz-test-terraform-statestore"
    key            = "terraform.tfstate"
    dynamodb_table = "egadsthefuzz-test-terraform-statestore-lock"
    profile        = ""
    role_arn       = ""
    encrypt        = "true"
  }
}
