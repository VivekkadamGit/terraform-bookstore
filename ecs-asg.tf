resource "aws_autoscaling_group" "ecs_asg" {
  name                = "ecs-asg"
  max_size            = var.asg_max_size   
  min_size            = var.asg_min_size   
  desired_capacity    = var.asg_desired_capacity   
  launch_configuration = aws_launch_configuration.ecs_launch_config.name
  vpc_zone_identifier = module.vpc.public_subnets 
  target_group_arns   = [aws_lb_target_group.ecs_target_group.arn]  
  health_check_grace_period = 300
  health_check_type         = "EC2"
}  

resource "aws_autoscaling_policy" "app_scale_out_policy" {
  name                   = "web_policy_up"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.ecs_asg.name
}

resource "aws_autoscaling_policy" "app_scale_in_policy" {
  name                   = "web_policy_down"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.ecs_asg.name
}

resource "aws_launch_configuration" "ecs_launch_config" {
  image_id            = "ami-054c337ee5048c313" #best to use ecs-image 
  instance_type        = var.lc_instance_type 
  key_name              = var.lc_key_name
  security_groups      = [aws_security_group.ecs_sg.id]
  iam_instance_profile = aws_iam_instance_profile.ecs_task_execution_role.name
  user_data            = "#!/bin/bash \n echo ECS_CLUSTER=${var.ecs_cluster_name} >> /etc/ecs/ecs.config"
}
