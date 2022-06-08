terraform {
  backend "s3" {
    bucket = "jimmy-nouran"
    key    = "jimmy.tfstate"
    region = "us-east-1"
    dynamodb_table = "jimmy-dynamodb"
    profile = "default"
  }
}
