# resource "aws_db_instance" "cluster" {
#   engine                    = "postgres"
#   engine_version            = "15"
#   allocated_storage         = 20
#   instance_class            = "db.t3.micro"
#   db_name                   = aws_ssm_parameter.dbname.value
#   username                  = aws_ssm_parameter.dbuser.value
#   password                  = aws_ssm_parameter.dbpassword.value
#   db_subnet_group_name      = aws_db_subnet_group.dbsubnet.id
#   vpc_security_group_ids    = [aws_security_group.rds_secgrp.id]
#   publicly_accessible       = true
#   skip_final_snapshot       = true


# }

# resource "aws_ssm_parameter" "dbname" {
#   name  = "/app/${var.db_system_name}/DATABASE_NAME"
#   type  = "String"
#   value = var.database_name
# }

# resource "aws_ssm_parameter" "dbuser" {
#   name  = "/app/${var.db_system_name}/DATABASE_MASTER_USERNAME"
#   type  = "String"
#   value = var.database_master_username
# }

# resource "aws_ssm_parameter" "dbpassword" {
#   name  = "/app/${var.db_system_name}/DATABASE_MASTER_PASSWORD"
#   type  = "SecureString"
#   value = random_password.password.result
# }

#This is the random password, if anyone wants to addd own password can be taken from CLI
#Just like Master_username or username.

# resource "random_password" "password" {
#   length           = 16
#   special          = true
#   override_special = "!#$%&*()-_=+[]{}<>:?"
# }

# resource "aws_db_subnet_group" "dbsubnet" {
#   name        = "${var.db_system_name}-cluster-subnet"
#   description = "Postgres ${var.db_system_name} cluster db subnet group"
#   subnet_ids  = module.vpc.database_subnets
# }



