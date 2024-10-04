# Outputs
output "vpc_id" {
  value = data.aws_vpc.default.id
}

output "subnet_ids" {
  value = data.aws_subnets.default.ids
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.my_cluster.name
}

output "ecs_cluster_arn" {
  value = aws_ecs_cluster.my_cluster.arn
}

output "ec2_instance_id" {
  value = aws_instance.ecs_instance.id
}

output "ec2_instance_public_ip" {
  value = aws_instance.ecs_instance.public_ip
}

output "ec2_instance_private_ip" {
  value = aws_instance.ecs_instance.private_ip
}

output "elastic_ip_address" {
  value = aws_eip.ecs_eip.public_ip
}

output "alb_dns_name" {
  value = aws_lb.my_alb.dns_name
}

output "security_group_id" {
  value = aws_security_group.ecs_sg.id
}

output "task_definition_arn" {
  value = aws_ecs_task_definition.my_task.arn
}

output "ecs_service_name" {
  value = aws_ecs_service.my_service.name
}
