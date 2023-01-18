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
  ami           = "ami-084e8c05825742534" #Amazon Linux 2 Kernel 5.10 AMI 2.0.20221210.1 x86_64 HVM gp2
  instance_type = "t2.micro"
  key_name = "dockerkey"
  
    connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("Desktop/dockerkey.pem")
    host        = aws_instance.dockeros.public_ip
    }
  
  provisioner "remote-exec" {
  inline = [
    "sudo yum update -y, sudo yum install -y docker, sudo service docker start, docker pull ridacap/flask-image:88"
    ]
  }
}
  

