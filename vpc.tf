# Create a VPC
resource "aws_vpc" "test" {
  cidr_block = var.vpc_cidr_block
  
  tags = {
    Name = "test"
  }
}