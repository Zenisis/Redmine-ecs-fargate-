resource "aws_lb" "redmine" {
  name               = "redmine-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.redmine.id]
  subnets            = [aws_subnet.public_1.id, aws_subnet.public_2.id]

  tags = {
    Name = "redmine-alb"
  }
}

resource "aws_lb_target_group" "redmine" {
  name        = "redmine-tg"
  port        = 3000
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "ip"

  health_check {
    path = "/"
  }
}

resource "aws_lb_listener" "redmine" {
  load_balancer_arn = aws_lb.redmine.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.redmine.arn
  }
}
