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
# Create NLB target group
resource "aws_lb_target_group" "redmine_nlb_tg" {
  name        = "redmine-nlb-tg"
  port        = 80
  protocol    = "TCP"
  vpc_id      = aws_vpc.main.id
  target_type = "alb"

  health_check {
    protocol = "HTTP"
    path     = "/"
    port     = "traffic-port"
  }
}

# Create NLB listener
resource "aws_lb_listener" "redmine_nlb_listener" {
  load_balancer_arn = aws_lb.redmine_nlb.arn
  port              = 80
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.redmine_nlb_tg.arn
  }
}
