<!-- BEGIN_TF_DOCS -->
## Requirements

You need to downloads the terraform binary to your Host and give the path to ENV. in the system.

You can add AWS credentials to the "provider.tf" file or add via "aws configure" to your local env,

Please refer the "tf.auto.tfvars" file to change any variables .

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.16.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 5.1.2 |

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_attachment.asg_to_target_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_attachment) | resource |
| [aws_autoscaling_group.ecs_asg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_autoscaling_policy.app_scale_in_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy) | resource |
| [aws_autoscaling_policy.app_scale_out_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy) | resource |
| [aws_cloudwatch_metric_alarm.app_cpu_alarm_down](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.app_cpu_alarm_up](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.ecs_cpu_alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_db_instance.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.dbsubnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_ecs_cluster.ecs_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_ecs_service.ecs_service1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_service.ecs_service2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_service.ecs_service3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_service.ecs_service4](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.ecs_task_definition1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_ecs_task_definition.ecs_task_definition2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_ecs_task_definition.ecs_task_definition3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_ecs_task_definition.ecs_task_definition4](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_iam_instance_profile.ecs_task_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.ecs_task_execution_roles](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ecs_task_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_launch_configuration.ecs_launch_config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_configuration) | resource |
| [aws_lb.ecs_alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.ecs_https_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.ecs_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.ecs_target_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_security_group.ecs_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.rds_secgrp](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_sns_topic.ecs_alarm_topic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_subscription.ecs_alarm_topic_subscription](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_ssm_parameter.dbname](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.dbpassword](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.dbuser](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [aws_iam_policy_document.ecs_task_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_asg_desired_capacity"></a> [asg\_desired\_capacity](#input\_asg\_desired\_capacity) | Desired instance you want in ASG | `number` | `1` | no |
| <a name="input_asg_max_size"></a> [asg\_max\_size](#input\_asg\_max\_size) | Maximum instance you want in ASG | `number` | `3` | no |
| <a name="input_asg_min_size"></a> [asg\_min\_size](#input\_asg\_min\_size) | minumum instance you want in ASG | `number` | `1` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Region in which AWS Resources to be created | `string` | `"ap-south-1"` | no |
| <a name="input_cluster_instance_class"></a> [cluster\_instance\_class](#input\_cluster\_instance\_class) | instance class for rds instance | `string` | `"db.t3.micro"` | no |
| <a name="input_database_master_username"></a> [database\_master\_username](#input\_database\_master\_username) | Your database master username | `string` | n/a | yes |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | Your database name | `string` | n/a | yes |
| <a name="input_db_system_name"></a> [db\_system\_name](#input\_db\_system\_name) | System name that the infrastructure is created for | `string` | n/a | yes |
| <a name="input_ecr_repo_name"></a> [ecr\_repo\_name](#input\_ecr\_repo\_name) | ecr repo Name | `string` | `"my-repo"` | no |
| <a name="input_ecs_cluster_name"></a> [ecs\_cluster\_name](#input\_ecs\_cluster\_name) | ecs cluster Name | `string` | `"my-cluster"` | no |
| <a name="input_ecs_cpu"></a> [ecs\_cpu](#input\_ecs\_cpu) | ECS CPU | `number` | `256` | no |
| <a name="input_ecs_desired_count"></a> [ecs\_desired\_count](#input\_ecs\_desired\_count) | ECS Desired count | `number` | `1` | no |
| <a name="input_ecs_memory"></a> [ecs\_memory](#input\_ecs\_memory) | ECS Memory | `number` | `512` | no |
| <a name="input_ecs_service_name_auth"></a> [ecs\_service\_name\_auth](#input\_ecs\_service\_name\_auth) | ecs service Name of service auth | `string` | `"my-ecs-service_auth"` | no |
| <a name="input_ecs_service_name_host"></a> [ecs\_service\_name\_host](#input\_ecs\_service\_name\_host) | ecs service Name of service host | `string` | `"my-ecs-service_host"` | no |
| <a name="input_ecs_service_name_migration"></a> [ecs\_service\_name\_migration](#input\_ecs\_service\_name\_migration) | ecs service Name of service migration | `string` | `"my-ecs-service_migration"` | no |
| <a name="input_ecs_service_name_web"></a> [ecs\_service\_name\_web](#input\_ecs\_service\_name\_web) | ecs service Name of service web | `string` | `"my-ecs-service-web"` | no |
| <a name="input_lc_instance_type"></a> [lc\_instance\_type](#input\_lc\_instance\_type) | Launch configuration instance type of EC2 | `string` | `"t2.micro"` | no |
| <a name="input_lc_key_name"></a> [lc\_key\_name](#input\_lc\_key\_name) | Launch configuration instance key name of EC2 | `string` | `"1month"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | `"ap-south-1"` | no |
| <a name="input_sns_email"></a> [sns\_email](#input\_sns\_email) | Email SNS for clodwatch | `string` | `"Vivek@gmail.com"` | no |
| <a name="input_target_value_for_scaledown"></a> [target\_value\_for\_scaledown](#input\_target\_value\_for\_scaledown) | target value for scaledown in ASG | `number` | `40` | no |
| <a name="input_target_value_for_scaleup"></a> [target\_value\_for\_scaleup](#input\_target\_value\_for\_scaleup) | Target value for scaleup in ASG | `number` | `60` | no |
| <a name="input_vpc_availability_zones"></a> [vpc\_availability\_zones](#input\_vpc\_availability\_zones) | VPC Availability Zones | `list(string)` | <pre>[<br>  "ap-south-1a",<br>  "ap-south-1b"<br>]</pre> | no |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | VPC CIDR Block | `string` | `"10.0.0.0/16"` | no |
| <a name="input_vpc_create_database_subnet_group"></a> [vpc\_create\_database\_subnet\_group](#input\_vpc\_create\_database\_subnet\_group) | VPC Create Database Subnet Group | `bool` | `true` | no |
| <a name="input_vpc_create_database_subnet_route_table"></a> [vpc\_create\_database\_subnet\_route\_table](#input\_vpc\_create\_database\_subnet\_route\_table) | VPC Create Database Subnet Route Table | `bool` | `true` | no |
| <a name="input_vpc_database_subnets"></a> [vpc\_database\_subnets](#input\_vpc\_database\_subnets) | VPC Database Subnets | `list(string)` | <pre>[<br>  "10.0.151.0/24",<br>  "10.0.152.0/24"<br>]</pre> | no |
| <a name="input_vpc_enable_nat_gateway"></a> [vpc\_enable\_nat\_gateway](#input\_vpc\_enable\_nat\_gateway) | Enable NAT Gateways for Private Subnets Outbound Communication | `bool` | `true` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VPC Name | `string` | `"myvpc"` | no |
| <a name="input_vpc_private_subnets"></a> [vpc\_private\_subnets](#input\_vpc\_private\_subnets) | VPC Private Subnets | `list(string)` | <pre>[<br>  "10.0.1.0/24",<br>  "10.0.2.0/24"<br>]</pre> | no |
| <a name="input_vpc_public_subnets"></a> [vpc\_public\_subnets](#input\_vpc\_public\_subnets) | VPC Public Subnets | `list(string)` | <pre>[<br>  "10.0.101.0/24",<br>  "10.0.102.0/24"<br>]</pre> | no |
| <a name="input_vpc_single_nat_gateway"></a> [vpc\_single\_nat\_gateway](#input\_vpc\_single\_nat\_gateway) | Enable only single NAT Gateway in one Availability Zone to save costs. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azs"></a> [azs](#output\_azs) | A list of availability zones spefified as argument to this module |
| <a name="output_db_subnets"></a> [db\_subnets](#output\_db\_subnets) | List of IDs of public subnets |
| <a name="output_dbname"></a> [dbname](#output\_dbname) | n/a |
| <a name="output_dbpassword_arn"></a> [dbpassword\_arn](#output\_dbpassword\_arn) | n/a |
| <a name="output_dbuser"></a> [dbuser](#output\_dbuser) | n/a |
| <a name="output_nat_public_ips"></a> [nat\_public\_ips](#output\_nat\_public\_ips) | List of public Elastic IPs created for AWS NAT Gateway |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | List of IDs of private subnets |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | List of IDs of public subnets |
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block) | The CIDR block of the VPC |
| <a name="output_vpc_main_id"></a> [vpc\_main\_id](#output\_vpc\_main\_id) | The ID of the VPC |

## Workflow

VPC and RDS are created via terraform modules.

We have used provides as AWS with ap-south-1 region. (can be change region by variable). The .tfstate file will be stored in s3 bucket as best practice.
(We can add dynamodb to store the .terraform.lock.hcl file to prevent multiple proccess clash at same moment.)

It will create one VPC for the application which will contains total 6 subnets
2 as public subnets(Internet gateway will be attached), 2 as private subnets(NAT Gateway will be attached) and 2 as database subnets.

There will be RDS as database, will use the database subnet. which will be publicly accessable so it can be used by its endpoints out of AWS service account. Security group as needed.

All the sensitive data like db username, passwords will be stored in systems manager.

There will be ECS, which contains a cluster --> Cluster contains 4 services Auth, Migrator, Web and Host.
(Their Port has not been changed due to application error)

There will be ECR to store the images. Images will be pushed via github actions by building docker image in github runner.

There will be ECS with EC2 type which needed EC2 instance with ECS agent and its proper IAM role. ASG created for with desired, min and max instance count. it will trigger via cloudwatch alarm. Security group as needed.

There will be ALB with HTTP and HTTPS listners. HTTP(80) will be redirect to HTTPS(443) and HTTPS will be redirect to ALB target groups.

Along with that, We have cloudwatch with SNS to the email which will give alert if given condition get fullfilled.



<!-- END_TF_DOCS -->