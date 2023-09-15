#Create an ECS cluster 
resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.ecs_cluster_name
}

# locals {
#   service_names = [var.ecs_service_name_auth,var.ecs_service_name_host,var.e]
# }


resource "aws_ecs_task_definition" "ecs_task_definition1" {
  family                   = "${var.ecr_repo_name}-1"
  cpu                      = var.ecs_cpu
  memory                   = var.ecs_memory
  requires_compatibilities = ["EC2"]
  execution_role_arn       = aws_iam_role.ecs_task_execution_roles.arn

  container_definitions = jsonencode([{
    name  = "${var.ecr_repo_name}"
    image = "dotnet-application-web:latest"
    portMappings = [{
      containerPort = 80
      hostPort      = 80
    }]
  }])
}

resource "aws_ecs_service" "ecs_service1" {
  name            = var.ecs_service_name_web
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task_definition1.arn
  desired_count   = var.ecs_desired_count
}


###
resource "aws_ecs_task_definition" "ecs_task_definition2" {
  family                   = "${var.ecr_repo_name}-2"
  cpu                      = var.ecs_cpu
  memory                   = var.ecs_memory
  requires_compatibilities = ["EC2"]
  execution_role_arn       = aws_iam_role.ecs_task_execution_roles.arn

  container_definitions = jsonencode([{
    name  = "${var.ecr_repo_name}"
    image = "dotnet-application-auth:latest"
    portMappings = [{
      containerPort = 80
      hostPort      = 80
    }]
  }])
}

resource "aws_ecs_service" "ecs_service2" {
  name            = var.ecs_service_name_auth
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task_definition2.arn
  desired_count   = var.ecs_desired_count
}

###
resource "aws_ecs_task_definition" "ecs_task_definition3" {
  family                   = "${var.ecr_repo_name}-3"
  cpu                      = var.ecs_cpu
  memory                   = var.ecs_memory
  requires_compatibilities = ["EC2"]
  execution_role_arn       = aws_iam_role.ecs_task_execution_roles.arn

  container_definitions = jsonencode([{
    name  = "${var.ecr_repo_name}"
    image = "dotnet-application-migrator:latest"
    portMappings = [{
      containerPort = 80
      hostPort      = 80
    }]
  }])
}

resource "aws_ecs_service" "ecs_service3" {
  name            = var.ecs_service_name_migration
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task_definition3.arn
  desired_count   = var.ecs_desired_count
}


###
resource "aws_ecs_task_definition" "ecs_task_definition4" {
  family                   = "${var.ecr_repo_name}-4"
  cpu                      = var.ecs_cpu
  memory                   = var.ecs_memory
  requires_compatibilities = ["EC2"]
  execution_role_arn       = aws_iam_role.ecs_task_execution_roles.arn

  container_definitions = jsonencode([{
    name  = "${var.ecr_repo_name}"
    image = "dotnet-application-host:latest"
    portMappings = [{
      containerPort = 80
      hostPort      = 80
    }]
  }])
}

resource "aws_ecs_service" "ecs_service4" {
  name            = var.ecs_service_name_host
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task_definition4.arn
  desired_count   = var.ecs_desired_count
}
