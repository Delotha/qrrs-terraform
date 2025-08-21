output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.qrrs.id  # or whatever your VPC resource is named
}

output "public_subnets" {
  description = "List of public subnet IDs"
  value       = aws_subnet.public[*].id  # or whatever your subnet resource names are
}
