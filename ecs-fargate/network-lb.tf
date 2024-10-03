resource "aws_lb" "network" {
  name               = "network-alb"
  internal           = false
  load_balancer_type = "network"
  subnets            = [aws_subnet.public_1.id, aws_subnet.public_2.id]

  enable_deletion_protection = false

  tags = {
    Name = "network-alb"
  }
}
