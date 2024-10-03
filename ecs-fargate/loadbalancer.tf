resource "aws_lb" "redmine" {
  name               = "redmine-alb"
  internal           = true
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

resource "aws_lb_target_group_attachment" "redmine_nlb_tg_attachment" {
  target_group_arn = aws_lb_target_group.redmine_nlb_tg.arn
  target_id        = aws_lb.redmine.arn
  port             = 80
}

resource "aws_eip_association" "redmine_eip_assoc" {
  allocation_id = aws_eip.redmine_eip.id
  network_interface_id = aws_lb.redmine_nlb.net_interface_id
}
