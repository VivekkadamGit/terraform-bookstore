resource "aws_lb" "ecs_alb" {
  name               = "ecs-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = module.vpc.public_subnets
  security_groups = [aws_security_group.ecs_sg.id]
}

resource "aws_lb_target_group" "ecs_target_group" {
  name     = "ecs-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
  target_type = "instance"
}

resource "aws_autoscaling_attachment" "asg_to_target_group" {
  autoscaling_group_name = aws_autoscaling_group.ecs_asg.name
  lb_target_group_arn  = aws_lb_target_group.ecs_target_group.arn
}

resource "aws_lb_listener" "ecs_listener" {
  load_balancer_arn = aws_lb.ecs_alb.arn
  port              = 80
  protocol          = "HTTP"
  
default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}


resource "aws_lb_listener" "ecs_https_listener" {
  load_balancer_arn = aws_lb.ecs_alb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"  
  certificate_arn   = "arn:aws:acm:ap-south-1:177501120181:certificate/4aff7388-4c7d-481d-9671-34aeaa7102aa" 

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecs_target_group.arn
  } 
}
