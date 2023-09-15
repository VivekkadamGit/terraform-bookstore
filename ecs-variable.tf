variable "ecs_cluster_name" {
  description = "ecs cluster Name"
  type = string 
  default = "my-cluster"
}

variable "ecr_repo_name" {
  description = "ecr repo Name"
  type = string 
  default = "my-repo"
}

variable "ecs_service_name" {
  description = "ecs service Name"
  type = string 
  default = "my-ecs-service"
}

variable "lc_instance_type" {
  description = "Launch configuration instance type of EC2"
  type = string 
  default = "t2.micro"
}

variable "lc_key_name" {
  description = "Launch configuration instance key name of EC2"
  type = string 
  default = "1month" #demo temp key change according to you.
}

##
# variable "asg_scale_down_cooldown" {
#   description = "ASG_cooldown time for scaledown"
#   type = number
#   default = 1200
# }

# variable "asg_scale_up_cooldown" {
#   description = "ASG cooldown time for scaleup"
#   type = number
#   default = 300
# }

variable "asg_max_size" {
  description = "Maximum instance you want in ASG"
  type = number 
  default = 3
}

variable "asg_min_size" {
  description = "minumum instance you want in ASG"
  type = number 
  default = 1
}

variable "asg_desired_capacity" {
  description = "Desired instance you want in ASG"
  type = number 
  default = 1
}

# Scale up if CPU is above 60%
variable "target_value_for_scaleup" {
  description = "Target value for scaleup in ASG"
  type = number 
  default = 60
}

 # Scale down if CPU is below 40%
variable "target_value_for_scaledown" {
  description = "target value for scaledown in ASG"
  type = number 
  default = 40
}

variable "ecs_desired_count" {
  description = "ECS Desired count "
  type = number 
  default = 1
}

variable "ecs_cpu" {
  description = "ECS CPU "
  type = number 
  default = 256
}

variable "ecs_memory" {
  description = "ECS Memory"
  type = number 
  default = 512
}


variable "sns_email" {
  description = "Email SNS for clodwatch"
  type = string
  default = "Vivek@gmail.com"
}