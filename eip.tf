# this is to create elastic ip

# Create Elastic IPs for NAT Gateways
resource "aws_eip" "elastic_eip_a" {
  domain = "vpc"

  tags = {
    Name = "ElasticIP-NAT-A"
  }
}

resource "aws_eip" "elastic_eip_b" {
  domain = "vpc"

  tags = {
    Name = "ElasticIP-NAT-B"
  }
}