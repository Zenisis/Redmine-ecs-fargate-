output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the VPC"
}

output "public_subnet_1_id" {
  value       = aws_subnet.public_1.id
  description = "The ID of the first public subnet"
}

output "public_subnet_2_id" {
  value       = aws_subnet.public_2.id
  description = "The ID of the second public subnet"
}

output "internet_gateway_id" {
  value       = aws_internet_gateway.main.id
  description = "The ID of the Internet Gateway"
}

output "security_group_id" {
  value       = aws_security_group.redmine.id
  description = "The ID of the security group for Redmine"
}

output "ecs_cluster_name" {
  value       = aws_ecs_cluster.main.name
  description = "The name of the ECS cluster"
}

output "ecs_cluster_arn" {
  value       = aws_ecs_cluster.main.arn
  description = "The ARN of the ECS cluster"
}

output "ecs_task_definition_arn" {
  value       = aws_ecs_task_definition.redmine.arn
  description = "The ARN of the ECS task definition"
}

output "ecs_service_name" {
  value       = aws_ecs_service.redmine.name
  description = "The name of the ECS service"
}

output "alb_dns_name" {
  value       = aws_lb.redmine.dns_name
  description = "The DNS name of the Application Load Balancer"
}

output "alb_arn" {
  value       = aws_lb.redmine.arn
  description = "The ARN of the Application Load Balancer"
}

output "target_group_arn" {
  value       = aws_lb_target_group.redmine.arn
  description = "The ARN of the ALB target group"
}
