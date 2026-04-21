########################################
# RDS SUBNET GROUP
########################################
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = module.vpc.private_subnets

  tags = {
    Name = "rds-subnet-group"
  }
}

########################################
# RDS SECURITY GROUP
########################################
resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Allow MySQL access from EKS nodes"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description     = "MySQL from EKS"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    
    # 🔥 Allow only EKS nodes
    security_groups = [module.eks.node_security_group_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-sg"
  }
}

########################################
# RDS INSTANCE
########################################
resource "aws_db_instance" "mysql" {
  identifier = "springboot-rds"

  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t3.micro"
  allocated_storage = 20

  db_name  = "student"
  username = "root"
  password = "springboot!1234"

  ########################################
  # NETWORKING
  ########################################
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  publicly_accessible = false   # 🔒 PRIVATE (BEST PRACTICE)

  ########################################
  # BEHAVIOR
  ########################################
  skip_final_snapshot = true
  multi_az            = false

  ########################################
  # OPTIONAL (GOOD PRACTICE)
  ########################################
  backup_retention_period = 0
  deletion_protection     = false

  tags = {
    Name = "springboot-rds"
  }
}
