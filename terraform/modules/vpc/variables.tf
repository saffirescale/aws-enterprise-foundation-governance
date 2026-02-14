variable "cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "environment" {
  description = "The environment name (dev, staging, prod)."
  type        = string
}

variable "tags" {
  description = "Additional tags to apply to resources."
  type        = map(string)
  default     = {}
}
