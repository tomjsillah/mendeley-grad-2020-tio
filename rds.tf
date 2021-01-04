resource "aws_db_instance" "grad-database-1" {
  instance_class          = "db.t2.micro"
  engine                  = "mysql"
  engine_version          = "5.7"
  multi_az                = true
  storage_type            = "gp2"
  allocated_storage       = 20
  name                    = "grad20Rds"
  username                = "admin"
  password                = "Barath3on"
  apply_immediately       = "true"
  backup_retention_period = 7
  backup_window           = "05:40-06:10"
  db_subnet_group_name    = aws_db_subnet_group.grad20.name
  vpc_security_group_ids  =  ["sg-0a61f5b2dcfe9aff2"]
}

resource "aws_security_group" "re-cares_rds_sg" {
  name        = "eks_cluster_rds_sg"
  description = "Security group for controlling the RDS instance."
  vpc_id      = aws_vpc.grad20.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["192.168.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Re-Cares RDS security group"
  }
}
