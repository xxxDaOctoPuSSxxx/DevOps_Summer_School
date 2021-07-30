# before TODO that:
# you must create IAM user/group/policies & take access_keys in AWS web-console;
# you must install AWS cli in terminal;
# then run aws configure & Enter your's keys, setup default region & data format json or yaml.

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
# Configure the AWS Provider
provider "aws" {
  region = "eu-central-1"
}
data "aws_ami" "latest_ubuntu" {
  owners      = ["099720109477"]
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]

  }
}

resource "aws_instance" "my_webserver" {
  ami                    = data.aws_ami.latest_ubuntu.id
  instance_type          = "t2.micro"
  user_data              = file("user_data.sh")
  vpc_security_group_ids = [aws_security_group.my_webserver.id]
}
resource "aws_security_group" "my_webserver" {
  name        = "WebServer Security Group"
  description = "My First SecurityGroup"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "Web Server Security Group"
    Owner = "Roman Hryshchenko"
  }
}
