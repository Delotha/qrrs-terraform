# Security group for the database
resource "aws_security_group" "db_sg" {
  name        = "${var.environment.name}-db-sg"
  description = "Allow PostgreSQL access within VPC"
  vpc_id      = var.vpc_id

  ingress {
    description = "PostgreSQL access from VPC"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["${var.environment.network_prefix}.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment.name}-db-sg"
  }
}

# DB Subnet Group
resource "aws_db_subnet_group" "db_subnet" {
  name       = "${var.environment.name}-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.environment.name}-db-subnet-group"
  }
}

# RDS PostgreSQL Instance
resource "aws_db_instance" "postgres" {
  identifier             = "${var.environment.name}-postgres"
  engine                 = "postgres"
  engine_version         = "15.5"
  instance_class         = "db.t4g.micro"    # cheapest option
  allocated_storage      = 20
  max_allocated_storage  = 100
  storage_type           = "gp3"

  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  port                   = 5432

  vpc_security_group_ids = [aws_security_group.db_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.db_subnet.name

  skip_final_snapshot    = true   # dev/testing only
  publicly_accessible    = true   # for testing; set false for prod

  tags = {
    Name = "${var.environment.name}-postgres"
  }
}
