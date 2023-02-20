#--------------------------------------------------
# Local resources
#--------------------------------------------------

data "aws_availability_zones" "available" {}


#--------------------------------------------------
# Terrafoem requiered providers VPC 
# -- Avoid Warnings for terraform modules --
#--------------------------------------------------

terraform {
    required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.5"
    }
  }
}

#--------------------------------------------------
# main VPC
#--------------------------------------------------


resource "aws_vpc" "vpc_main" {
  cidr_block           = var.cidr_vpc_main
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(var.tags, var.vpc_tags, tomap({"Name" = "vpc_main_${var.sufix_name}-${terraform.workspace}"}))
}

# Subnets

resource "aws_subnet" "subnet_main_private" {
  count             = length(var.cidr_vpc_main_subnet_private_az)
  cidr_block        = var.cidr_vpc_main_subnet_private_az[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  vpc_id            = aws_vpc.vpc_main.id

  tags = merge(var.tags, var.vpc_tags, tomap({"Name" = "subnet_main_private_${count.index}${var.sufix_name}"}))
}

resource "aws_subnet" "subnet_main_public" {
  count             = length(var.cidr_vpc_main_subnet_public_az)
  cidr_block        = var.cidr_vpc_main_subnet_public_az[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  vpc_id            = aws_vpc.vpc_main.id

  tags = merge(var.tags, var.vpc_tags, tomap({"Name" = "subnet_main_public_${count.index}${var.sufix_name}"}))
}

# Internet Gateway
resource "aws_internet_gateway" "igw_main" {
  # if has public subnet
  count  = length(var.cidr_vpc_main_subnet_public_az) > 0 ? 1 : 0
  vpc_id = aws_vpc.vpc_main.id

  tags = merge(var.tags, var.vpc_tags, tomap({"Name" = "igw_main${var.sufix_name}"}))
}

# Routing
resource "aws_route_table" "rtb_default_main_public" {
  # if has public subnet
  count  = length(var.cidr_vpc_main_subnet_public_az) > 0 ? 1 : 0
  vpc_id = aws_vpc.vpc_main.id

  tags = merge(var.tags, var.vpc_tags, tomap({"Name" = "rtb_default_main_public${var.sufix_name}"}))
}

resource "aws_route_table" "rtb_default_main_private_az" {
  count  = length(var.cidr_vpc_main_subnet_private_az)
  vpc_id = aws_vpc.vpc_main.id

  tags = merge(var.tags, var.vpc_tags, tomap({"Name" = "rtb_default_main_private_az${count.index}${var.sufix_name}"}))
}

# Association

resource "aws_route_table_association" "assoc_subnet_main_public" {
  count          = length(var.cidr_vpc_main_subnet_public_az)
  route_table_id = aws_route_table.rtb_default_main_public[0].id
  subnet_id      = aws_subnet.subnet_main_public[count.index].id
}

resource "aws_route_table_association" "assoc_subnet_main_private" {
  count          = length(var.cidr_vpc_main_subnet_private_az) > 0 ? length(aws_route_table.rtb_default_main_private_az) : 0
  route_table_id = aws_route_table.rtb_default_main_private_az[count.index].id
  subnet_id      = aws_subnet.subnet_main_private[count.index].id
}

resource "aws_route" "route_default_gateway_main_public" {
  count                  = length(var.cidr_vpc_main_subnet_public_az) > 0 ? 1 : 0
  route_table_id         = aws_route_table.rtb_default_main_public[0].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw_main[0].id
}


