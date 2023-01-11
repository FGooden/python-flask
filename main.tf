terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.74.2"
    }
  }

  #required_version = ">= 1.2.0"
}

provider "aws" {
  profile = "default"
  region = "eu-west-2"
}

resource "aws_instance" "dockeros" {
  ami           = "ami-09c3ef3201cf7dbdb" #EKS Kubernetes Worker AMI with AmazonLinux2 image
  instance_type = "t2.micro"
  
  #keypair
  key_name = "dockerkey"

  tags = {
    Name = "DockJenk"
  }
  
  connection {
    type        = "ssh"
    user        = "ec2-user"
    host        = aws_instance.dockeros.public_ip
  }
}

output "Instance_ip" {
  value = aws_instance.dockeros.public_ip
}
  

