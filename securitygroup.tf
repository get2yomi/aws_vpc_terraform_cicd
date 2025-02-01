# ssh security group
resource "aws_security_group" "eice" {
  vpc_id = aws_vpc.test.id  # Replace with your VPC ID

  # Inbound Rules
  ingress {
    description      = "Allow SSH"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/16"]  # Open to all (Use a specific IP for  security this is for traffic coming from the vpc)
  }

  # Outbound Rules (Allow all traffic)
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "eice security group"
  }
}


# ssh security group
resource "aws_security_group" "webserversecuritygroup" {
  vpc_id = aws_vpc.test.id  # Replace with your VPC ID

  # Inbound Rules
  ingress {
    description      = "Allow HTTP"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]# Open to all (Use a specific IP for security)
  }
  ingress {
    description      = "Allow HTTPS"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"] # Open to all (Use a specific IP for security)
  }
  ingress {
    description      = "Allow SSH"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"] # Open to all (Use a specific IP for  security this is for traffic coming from the vpc)
  }
  # Outbound Rules (Allow all traffic)
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "WebServerSecurityGroup"
  }
}

# application load balancer will need this
resource "aws_security_group" "albserversecuritygroup" {
  vpc_id = aws_vpc.test.id  # Replace with your VPC ID

  # Inbound Rules
  ingress {
    description      = "Allow HTTP"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]  # Open to all (Use a specific IP for security)
  }
  ingress {
    description      = "Allow HTTPS"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]  # Open to all (Use a specific IP for security)
  }

  # Outbound Rules (Allow all traffic)
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "albServerSecurityGroup"
  }
}