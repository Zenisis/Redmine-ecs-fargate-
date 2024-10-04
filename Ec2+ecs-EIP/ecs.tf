# ecs cluster
resource "aws_ecs_cluster" "my_cluster" {
  name = "my-ecs-cluster"
}
# ECS Task Definition
resource "aws_ecs_task_definition" "my_task" {
  family                   = "my-task"
  network_mode             = "bridge"
  requires_compatibilities = ["EC2"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([
    {
      name  = "my-container"
      image = "nginx:latest"
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
}

# ECS Service
resource "aws_ecs_service" "my_service" {
  name            = "my-service"
  cluster         = aws_ecs_cluster.my_cluster.id
  task_definition = aws_ecs_task_definition.my_task.arn
  desired_count   = 1
  launch_type     = "EC2"

  load_balancer {
    target_group_arn = aws_lb_target_group.my_tg.arn
    container_name   = "my-container"
    container_port   = 80
  }
}
