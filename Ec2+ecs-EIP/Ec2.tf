# EC2 Instance for ECS
resource "aws_instance" "ecs_instance" {
  ami           = "ami-078264b8ba71bc45e"  # Amazon ECS-Optimized Amazon Linux 2 AMI
  instance_type = "t3.micro"
  subnet_id     = data.aws_subnets.default.ids[0]

  vpc_security_group_ids = [aws_security_group.ecs_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.ecs_agent.name
  user_data              = <<-EOF
                            #!/bin/bash
                            echo ECS_CLUSTER=${aws_ecs_cluster.my_cluster.name} >> /etc/ecs/ecs.config
                            EOF

  tags = {
    Name = "ecs-instance"
  }
}
