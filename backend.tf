terraform {
  backend "s3" {
    bucket = "jimmyy-nouran"
    key    = "jimmy.tfstate"
    region = "eu-central-1"
    dynamodb_table = "jimmy-dynamodb"
    profile = "default"
  }
}
