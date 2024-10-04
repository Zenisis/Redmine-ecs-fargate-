# Elastic IP
resource "aws_eip" "ecs_eip" {
  instance = aws_instance.ecs_instance.id
  domain   = "vpc"
}
