terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
  backend "s3" {
    bucket         = "my-tf-state-staging"
    key            = "staging/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "my-tf-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source     = "../../modules/vpc"
  cidr_block = "10.0.0.0/16"
  name       = "foundation-vpc"
  environment = "staging"
}

module "rds_postgres" {
  source      = "../../modules/rds_postgres"
  db_name     = "app_db"
  environment = "staging"
  # ...add other variables as needed
}

# Example placeholder for future services
# module "app" {
#   source = "../../modules/ecs_service"
# }
