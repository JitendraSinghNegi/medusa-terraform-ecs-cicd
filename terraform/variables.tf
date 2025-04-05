variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "region" {
  default = "us-east-1"
}
variable "ecs_cluster_name" {
  default = "medusa-cluster"
}
variable "service_name" {
  default = "medusa-service"
}
variable "container_port" {
  default = 9000
}
variable "image_url" {
  description = "Docker image URL for Medusa"
}
