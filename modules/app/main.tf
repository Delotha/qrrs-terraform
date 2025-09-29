# ECS Cluster
resource "aws_ecs_cluster" "app" {
	name = "qcrs-app-cluster"
}

# IAM Role for ECS Task Execution
resource "aws_iam_role" "ecs_task_execution" {
	name = "ecsTaskExecutionRole"
	assume_role_policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Effect": "Allow",
			"Principal": {
				"Service": "ecs-tasks.amazonaws.com"
			},
			"Action": "sts:AssumeRole"
		}
	]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution" {
	role       = aws_iam_role.ecs_task_execution.name
	policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

# ECS Task Definition
resource "aws_ecs_task_definition" "app" {
	family                   = "qcrs-app-task"
	network_mode             = "bridge"
	cpu                      = "256"
	memory                   = "512"
	execution_role_arn       = aws_iam_role.ecs_task_execution.arn

	container_definitions = jsonencode([
		{
			name      = "qcrs-app"
			image     = "xelyrithx/qcrs:latest"
			essential = true
			portMappings = [
				{
					containerPort = 80
					hostPort      = 80
				}
			]
		}
	])
}

# ECS Service
resource "aws_ecs_service" "app" {
	name            = "qcrs-app-service"
	cluster         = aws_ecs_cluster.app.id
	task_definition = aws_ecs_task_definition.app.arn
	desired_count   = 1
	launch_type     = "EC2"
}

# EC2 Instance for ECS Cluster (Free Tier eligible t2.micro)
resource "aws_instance" "ecs" {
	ami           = var.ecs_ami_id
	instance_type = "t2.micro"
	iam_instance_profile = aws_iam_instance_profile.ecs_instance_profile.name
	user_data     = <<EOF
#!/bin/bash
echo ECS_CLUSTER=${aws_ecs_cluster.app.name} >> /etc/ecs/ecs.config
EOF
	tags = {
		Name = "qcrs-ecs-instance"
	}
}

# IAM Role and Instance Profile for EC2 ECS Instance
resource "aws_iam_role" "ecs_instance" {
	name = "ecsInstanceRole"
	assume_role_policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Effect": "Allow",
			"Principal": {
				"Service": "ec2.amazonaws.com"
			},
			"Action": "sts:AssumeRole"
		}
	]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ecs_instance" {
	role       = aws_iam_role.ecs_instance.name
	policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_instance_profile" "ecs_instance_profile" {
	name = "ecsInstanceProfile"
	role = aws_iam_role.ecs_instance.name
}
