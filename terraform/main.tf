provider "aws" {
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
resource "aws_ecs_cluster" "medusa" {
  name = var.ecs_cluster_name
}
resource "aws_ecs_task_definition" "medusa_task" {
  family                   = "medusa-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  memory                   = "512"
  cpu                      = "256"
  container_definitions = jsonencode([
    {
      name      = "medusa"
      image     = var.image_url
      memory    = 512
      cpu       = 256
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
        }
      ]
    }
  ])
}
resource "aws_ecs_service" "medusa_service" {
  name            = var.service_name
  cluster         = aws_ecs_cluster.medusa.id
  task_definition = aws_ecs_task_definition.medusa_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"
  network_configuration {
    subnets          = ["subnet-xxxxxxxx", "subnet-yyyyyyyy"]
    assign_public_ip = true
  }
}
