resource "aws_launch_template" "web_launch_template" {
  name          = "web-instance-template"
  image_id      = "ami-0e1bed4f06a3b463d"  # Replace with a valid AMI ID
  instance_type = "t2.micro"

  network_interfaces {
    associate_public_ip_address = false
    security_groups = [aws_security_group.eice.id]
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "AutoScaledWebServer"
    }
  }
}
