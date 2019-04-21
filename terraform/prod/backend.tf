terraform {
  backend "gcs" {
    bucket  = "storage-bucket-integer137-prod"
    prefix  = "prod"
    project = "infra-235107"
  }
}
