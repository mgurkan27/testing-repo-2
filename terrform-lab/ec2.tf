module "s3_bucket_for_utility" {
  source = "./module/s3"
  bucket_name = "amitsehgal-testing-bucket-artifact"
}

module "s3_bucket_for_utility-1" {
  source = "./module/s3"
  bucket_name = "amitsehgal-testing-bucket-artifact-1"
}

module "s3_bucket_for_utility-2" {
  source = "./module/s3"
  bucket_name = "amitsehgal-testing-bucket-artifact-2"
}

resource "aws_instance" "example" {
  ami                    = var.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.instance.id, aws_security_group.ssh.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y httpd
              sudo systemctl start httpd.service
              sudo systemctl enable httpd.service
              sudo echo "<h1> At $(hostname -f) </h1>" > /var/www/html/index.html                   
              EOF
  tags = {
    Name = "terraform-example"
  }
  key_name             = var.key_name
  iam_instance_profile = aws_iam_instance_profile.test_profile.id
}

resource "aws_iam_instance_profile" "test_profile" {
  name = "test_profile"
  role = aws_iam_role.test_role.name
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "ssh" {
  name = "terraform-ssh-instance"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}