#Create an ECS cluster 
resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.ecs_cluster_name
}


resource "aws_ecs_task_definition" "ecs_task_definition" {
  family                   = var.ecr_repo_name
  cpu                      = var.ecs_cpu
  memory                   = var.ecs_memory
  requires_compatibilities = ["EC2"]
  execution_role_arn       = aws_iam_role.ecs_task_execution_roles.arn

  container_definitions = jsonencode([{
    name  = "${var.ecr_repo_name}"
    image = "dotnet-application:latest"
    portMappings = [{
      containerPort = 80
      hostPort      = 80
    }]
  }])
}

resource "aws_ecs_service" "ecs_service" {
  name            = var.ecs_service_name
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task_definition.arn
  desired_count   = var.ecs_desired_count
}

# resource "aws_ecs_task_definition" "ecs_task_definition" {
#   family                   = var.ecr_repo_name
#   cpu                      = var.ecs_cpu
#   memory                   = var.ecs_memory
#   requires_compatibilities = ["EC2"]
#   execution_role_arn       = aws_iam_role.ecs_task_execution_roles.arn

#   container_definitions = jsonencode([{
#     name  = "${var.ecr_repo_name}"
#     image = "dotnet-application:latest"
#     portMappings = [{
#       containerPort = 80
#       hostPort      = 80
#     }]
#   }])
# }

# resource "aws_ecs_service" "ecs_service" {
#   name            = var.ecs_service_name
#   cluster         = aws_ecs_cluster.ecs_cluster.id
#   task_definition = aws_ecs_task_definition.ecs_task_definition.arn
#   desired_count   = var.ecs_desired_count
# }


# resource "aws_ecs_task_definition" "ecs_task_definition" {
#   family                   = var.ecr_repo_name
#   cpu                      = var.ecs_cpu
#   memory                   = var.ecs_memory
#   requires_compatibilities = ["EC2"]
#   execution_role_arn       = aws_iam_role.ecs_task_execution_roles.arn

#   container_definitions = jsonencode([{
#     name  = "${var.ecr_repo_name}"
#     image = "dotnet-application:latest"
#     portMappings = [{
#       containerPort = 80
#       hostPort      = 80
#     }]
#   }])
# }

# resource "aws_ecs_service" "ecs_service" {
#   name            = var.ecs_service_name
#   cluster         = aws_ecs_cluster.ecs_cluster.id
#   task_definition = aws_ecs_task_definition.ecs_task_definition.arn
#   desired_count   = var.ecs_desired_count
# }


# resource "aws_ecs_task_definition" "ecs_task_definition" {
#   family                   = var.ecr_repo_name
#   cpu                      = var.ecs_cpu
#   memory                   = var.ecs_memory
#   requires_compatibilities = ["EC2"]
#   execution_role_arn       = aws_iam_role.ecs_task_execution_roles.arn

#   container_definitions = jsonencode([{
#     name  = "${var.ecr_repo_name}"
#     image = "dotnet-application:latest"
#     portMappings = [{
#       containerPort = 80
#       hostPort      = 80
#     }]
#   }])
# }

# resource "aws_ecs_service" "ecs_service" {
#   name            = var.ecs_service_name
#   cluster         = aws_ecs_cluster.ecs_cluster.id
#   task_definition = aws_ecs_task_definition.ecs_task_definition.arn
#   desired_count   = var.ecs_desired_count
# }
