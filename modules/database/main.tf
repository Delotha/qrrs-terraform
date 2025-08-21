variable "app_sg_ids" {
  description = "List of security group IDs allowed to access the DB"
  type        = list(string)
  default     = []
}

# Security group for the database
resource "aws_security_group" "db_sg" {
  name        = "${var.environment.name}-db-sg"
  description = "Allow database access within VPC"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Database access from VPC"
    from_port       = var.db.port
    to_port         = var.db.port
    protocol        = "tcp"
    security_groups = var.app_sg_ids
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

# RDS Database Instance
resource "aws_db_instance" "database" {
  identifier             = "${var.environment.name}-${var.db.name}"
  engine                 = var.db.engine
  engine_version         = var.db.version
  instance_class         = var.db.instance_size
  allocated_storage      = var.db.min_size
  max_allocated_storage  = var.db.max_size
  storage_type           = var.db.storage_type

  db_name                = var.db.name
  username               = var.db.username
  password               = var.db_password
  port                   = var.db.port

  vpc_security_group_ids = [aws_security_group.db_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.db_subnet.name

  skip_final_snapshot    = var.environment.name == "dev" ? true : false
  publicly_accessible    = var.environment.name == "dev" ? true : false
  deletion_protection    = var.environment.name == "prod" ? true : false

  tags = {
    Name = "${var.environment.name}-${var.db.name}"
  }
}
