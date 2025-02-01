variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "vpc cidr block for vpc"
  type        = string
  default     = "10.0.0.0/16"
}

variable "pub_cidr_block_a" {
  description = "subnet cidr block for public subnet a"
  type        = string
  default     = "10.0.0.0/24"
}
variable "pub_cidr_block_b" {
  description = "subnet cidr block for public subnet b"
  type        = string
  default     = "10.0.1.0/24"
}

variable "priv_app_cidr_block_a" {
  description = "subnet cidr block for private app subnet a"
  type        = string
  default     = "10.0.2.0/24"
}

variable "priv_app_cidr_block_b" {
  description = "subnet cidr block for private app subnet b"
  type        = string
  default     = "10.0.3.0/24"
}
variable "priv_data_cidr_block_a" {
  description = "subnet cidr block for private database subnet a"
  type        = string
  default     = "10.0.4.0/24"
}

variable "priv_data_cidr_block_b" {
  description = "subnet cidr private databae subnet b"
  type        = string
  default     = "10.0.5.0/24"
}




# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY
# TF_VAR_bucket_name
# TF_VAR_instance_type
# TF_VAR_aws_region