resource "aws_security_group" "ecs_sg" {
  name        = "ecs-security-group"
  description = "Allow inbound traffic for ECS"
  vpc_id      = data.aws_vpc.default.id
