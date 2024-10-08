resource "aws_security_group" "redmine" {
  name        = "redmine-sg"
  description = "Allow inbound traffic for Redmine"
  vpc_id      = aws_vpc.main.id
     dynamic "ingress" {
    for_each = [0, 22, 443, 80, 8080, 1337, 8000, 8001, 8005, 8004,3000 -1]
    content {
      from_port   = 0
      to_port     = 0
      protocol    = "-1" # Use "-1" for all protocols
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "redmine-sg"
  }
}
