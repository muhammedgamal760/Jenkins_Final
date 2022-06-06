terraform {
  backend "s3" {
    bucket = "jimmyyy-bucket"
    key    = "jimmy.tfstate"
    region = "us-east-1"
    dynamodb_table = "jimmy-dynamodb"
    profile = "default"
  }
}
