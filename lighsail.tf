resource "aws_lightsail_instance" "testserver" {
  name              = "terraform-test"
  availability_zone = "us-east-1a"  # Change the availability zone if needed
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "nano_2_0"

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd
              sudo echo "<h1>This Server is created using Terraform </h1>" >> /var/www/html/index.html
              EOF

  tags = {
    env = "dev"
  }
}