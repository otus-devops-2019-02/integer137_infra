terraform {
  backend "gcs" {
    bucket  = "storage-bucket-integer137-stage"
    prefix  = "terraform/stage"
    project = "infra-235107"
  }
}
