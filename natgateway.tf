# application loadbalancer will need this
# elastic ip to be able to have access to the internet


# NAT Gateway for Subnet A
resource "aws_nat_gateway" "nat_gw_a" {
  allocation_id = aws_eip.elastic_eip_a.id
  subnet_id     = aws_subnet.public_app_a.id  # NAT should be in a public subnet

  tags = {
    Name = "NATGatewayA"
  }

  depends_on = [aws_eip.elastic_eip_a]  # Ensure EIP is created first
}

# NAT Gateway for Subnet B
resource "aws_nat_gateway" "nat_gw_b" {
  allocation_id = aws_eip.elastic_eip_b.id
  subnet_id     = aws_subnet.public_app_b.id  # NAT should be in a public subnet

  tags = {
    Name = "NATGatewayB"
  }

  depends_on = [aws_eip.elastic_eip_b]  # Ensure EIP is created first
}
