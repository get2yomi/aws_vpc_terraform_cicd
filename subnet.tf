
resource "aws_subnet" "public_app_a" {
  vpc_id     = aws_vpc.test.id
  cidr_block = var.pub_cidr_block_a
  availability_zone        = "us-east-1a"  # Ensure different AZs
  tags = {
    Name = " public_app_a"
  }
}

resource "aws_subnet" "public_app_b" {
  vpc_id     = aws_vpc.test.id
  cidr_block = var.pub_cidr_block_b
  availability_zone        = "us-east-1b"  # Ensure different AZs
  tags = {
    Name = " public_app_b"
  }
}

resource "aws_subnet" "priv_app_cidr_block_a" {
  vpc_id     = aws_vpc.test.id
  cidr_block = var.priv_app_cidr_block_a
  availability_zone        = "us-east-1a"  # Ensure different AZs
  tags = {
    Name = " private_app_a"
  }
}

resource "aws_subnet" "priv_app_cidr_block_b" {
  vpc_id     = aws_vpc.test.id
  cidr_block = var.priv_app_cidr_block_b
  availability_zone        = "us-east-1b"  # Ensure different AZs
  tags = {
    Name = " private_app_b"
  }
}

resource "aws_subnet" "priv_data_cidr_block_a" {
  vpc_id     = aws_vpc.test.id
  cidr_block = var.priv_data_cidr_block_a
  availability_zone        = "us-east-1a"  # Ensure different AZs
  tags = {
    Name = " private_data_b"
  }
}

resource "aws_subnet" "priv_data_cidr_block_b" {
  vpc_id     = aws_vpc.test.id
  cidr_block = var.priv_data_cidr_block_b
  availability_zone        = "us-east-1b"  # Ensure different AZs
  tags = {
    Name = " private data_b"
  }
}