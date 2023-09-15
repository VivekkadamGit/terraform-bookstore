#Not required - Skip it


# data "aws_availability_zones" "zones" {
#   state = "available"
# }

# data "aws_subnets" "subnets" {
#   value = module.vpc.vpc_main_id
# }

# data "aws_subnets" "subnets" {
#   filter {
#     name   = "vpc-id"
#     values = [module.vpc.vpc_id]
#   }
# }

# data "aws_subnet" "subnet" {
#   for_each = toset(data.aws_subnets.subnets.ids)
#   id       = each.value
# }