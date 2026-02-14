# VPC Module

resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = merge({
    Name        = "${var.environment}-vpc"
    Environment = var.environment
  }, var.tags)
}

# ...add subnets, gateways, and other resources as needed

output "vpc_id" {
  value = aws_vpc.main.id
  description = "The ID of the VPC."
}
