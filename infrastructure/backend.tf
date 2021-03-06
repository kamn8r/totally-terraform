terraform {
  backend "s3" {
    bucket         = "cpe-backend-8675309"
    key            = "backend.tfstate"
    region         = "us-east-1"
    dynamodb_table = "s3-state-lock"
  }
}