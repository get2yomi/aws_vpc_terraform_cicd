resource "aws_route_table" "public_route_table"{
  vpc_id = aws_vpc.test.id

  tags = {
    Name = "Public Route Table A"
  }
}



resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.test.id

  tags = {
    Name = "Private Route Table a"
  }
}


# routing to the internet
resource "aws_route" "internet_access_a" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_igw.id
}
# Routing to the internet for Public Route Table B
resource "aws_route" "internet_access_b" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_igw.id
}


# ensuring that the route table is associated with the subnet
resource "aws_route_table_association" "public_app_a" {
  subnet_id      = aws_subnet.public_app_a.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_app_b" {
  subnet_id      = aws_subnet.public_app_b.id
  route_table_id = aws_route_table.public_route_table.id
}

# assciateting the route table with privaate app subnet
resource "aws_route_table_association" "private_app_a" {
  subnet_id      = aws_subnet.priv_app_cidr_block_a.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_app_b" {
  subnet_id      = aws_subnet.priv_app_cidr_block_b.id
  route_table_id = aws_route_table.private_route_table.id
}

# assciateting the route table with privaate app_data subnet
resource "aws_route_table_association" "private_app_data_a" {
  subnet_id      = aws_subnet.priv_data_cidr_block_a.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_app_data_b" {
  subnet_id      = aws_subnet.priv_data_cidr_block_b.id
  route_table_id = aws_route_table.private_route_table.id
}