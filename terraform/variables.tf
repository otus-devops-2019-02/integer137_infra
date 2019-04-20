variable "project" {
  description = "The project in which the resource belongs. If it is not provided, the provider project is used."
}
variable "region" {
  description = "The GCS region."
  default     = "europe-west1"
}
