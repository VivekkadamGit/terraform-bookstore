# VPC Variables
# You can give the values here and that can be change inside the code.
vpc_name = "bookstore-vpc"
vpc_cidr_block = "10.0.0.0/16"
vpc_availability_zones = ["ap-south-1a", "ap-south-1b"] 
vpc_public_subnets = ["10.0.101.0/24", "10.0.102.0/24"] # public and private subnet should not clash.
vpc_private_subnets = ["10.0.1.0/24", "10.0.2.0/24"] # Use big diffrench b/w private and public subnet.
vpc_database_subnets= ["10.0.151.0/24", "10.0.152.0/24"] # Database do not need much hosts
vpc_create_database_subnet_group = true 
vpc_create_database_subnet_route_table = true   
vpc_single_nat_gateway = true # To save cost you can use single NAT gateway in private subnets.

#RDS Variables
# database_name = "database1"
# database_master_username = "postgres"
# cluster_instance_class = "db.t3.micro"
# region = "ap-south-1"
# db_system_name = "db1"


#ECS Variables
ecs_cluster_name = "my-cluster"
ecr_repo_name = "dotnet-application"
ecs_service_name = "my-ecs-service"
lc_instance_type = "t2.micro"
lc_key_name = "1month" 
# asg_scale_down_cooldown = 1200
# asg_scale_up_cooldown = 300
asg_max_size = 3
asg_min_size = 1
asg_desired_capacity = 1
target_value_for_scaleup = 60
target_value_for_scaledown = 40
ecs_cpu = 256
ecs_memory = 512
ecs_desired_count = 1
sns_email = "vivek@gmail.com"