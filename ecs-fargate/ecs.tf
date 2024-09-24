resource "aws_ecs_cluster" "main" {
  name = "redmine-cluster"
}

# ECS Task Definition
resource "aws_ecs_task_definition" "redmine" {
  family                   = "redmine"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([
    {
      name  = "redmine"
      image = "redmine:latest"
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
        }
      ]
    }
  ])
}

# ECS Service
resource "aws_ecs_service" "redmine" {
  name            = "redmine-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.redmine.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets          = [aws_subnet.public_1.id, aws_subnet.public_2.id]
    security_groups  = [aws_security_group.redmine.id]
    assign_public_ip = true
  }
}
