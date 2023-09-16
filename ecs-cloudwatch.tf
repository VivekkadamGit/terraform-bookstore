resource "aws_cloudwatch_metric_alarm" "ecs_cpu_alarm" {
  alarm_name          = "ECS_CPU_Alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 4
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = 300  # 5 minutes
  statistic           = "Average"
  threshold           = 60
  alarm_description   = "Alarm for ECS CPU Usage exceeding 60% for 20 minutes"
  alarm_actions       = [aws_sns_topic.ecs_alarm_topic.arn]

  dimensions = {
    ClusterName        = var.ecs_cluster_name 
  }
}

resource "aws_sns_topic" "ecs_alarm_topic" {
  name = "ECS_CPU_Alarm_Topic"
}

resource "aws_sns_topic_subscription" "ecs_alarm_topic_subscription" {
  topic_arn = aws_sns_topic.ecs_alarm_topic.arn
  protocol  = "email"  
  endpoint  = var.sns_email 
}


resource "aws_cloudwatch_metric_alarm" "app_cpu_alarm_up" {
  alarm_name          = "web_cpu_alarm_up"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = var.target_value_for_scaleup

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.ecs_asg.name
  }

  alarm_description = "This metric monitor EC2 instance CPU utilization"
  alarm_actions     = [aws_autoscaling_policy.app_scale_out_policy.arn]
}


resource "aws_cloudwatch_metric_alarm" "app_cpu_alarm_down" {
  alarm_name          = "web_cpu_alarm_down"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 1200
  statistic           = "Average"
  threshold           = var.target_value_for_scaledown

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.ecs_asg.name
  }

  alarm_description = "This metric monitor EC2 instance CPU utilization"
  alarm_actions     = [aws_autoscaling_policy.app_scale_in_policy.arn]
}