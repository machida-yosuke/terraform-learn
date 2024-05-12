resource "aws_instance" "server" {
  ami = "ami-0ab3794db9457b60a"
  instance_type = var.instance_type
  tags = {
    Name = "TestWebServer"
  }
 user_data = <<-EOF
                #!/bin/bash
                sudo yum update -y
                sudo amazon-linux-extras install epel -y
                sudo yum install nginx -y
                sudo systemctl start nginx
                sudo systemctl enable nginx
              EOF
}