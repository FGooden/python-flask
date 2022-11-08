terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.37.0"
    }
  }

  #required_version = ">= 1.0.0"
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0648ea225c13e0729"
  instance_type = "t2.micro"

  tags = {
    Name = "Jenkinstf"
  }
}
resource "aws_iam_role" "terraform-jenkins" {
  name = "terraform-jenkinse"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}
