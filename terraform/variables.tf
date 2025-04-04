variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
}
variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
}
variable "ecs_cluster_name" {
  description = "Name of ECS cluster"
  default     = "medusa-cluster"
}
variable "service_name" {
  description = "Name of ECS service"
  default     = "medusa-service"
}
variable "container_port" {
  description = "Container Port"
  default     = 9000
}
