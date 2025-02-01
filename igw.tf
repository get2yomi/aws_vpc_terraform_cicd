# attaching igw to my vpc
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.test.id

  tags = {
    Name = "my_igw"
  }
}   