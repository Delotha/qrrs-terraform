output "ec2_public_dns" {
  description = "Public DNS of the ECS EC2 instance running the app."
  value       = aws_instance.ecs.public_dns
}
