terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  alias  = "useast"
  region = "us-east-1"
}

provider "aws" {
  alias  = "uswest"
  region = "us-west-2"
}

data "aws_ami" "latest_amazon_linux_useast" {
  provider    = aws.useast
  most_recent = true
  owners      = ["amazon"]  # Official AMIs from AWS

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "aws_ami" "latest_amazon_linux_uswest" {
  provider    = aws.uswest
  most_recent = true
  owners      = ["amazon"]  # Official AMIs from AWS

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "useast_instance" {
  provider      = aws.useast
  ami           = data.aws_ami.latest_amazon_linux_useast.id  # Replace with a valid AMI for us-east-1
  instance_type = "t2.micro"
  tags = {
    Name = "EC2-Instance-US-East"
  }
}

resource "aws_instance" "uswest_instance" {
  provider      = aws.uswest
  ami           = data.aws_ami.latest_amazon_linux_uswest.id  # Replace with a valid AMI for us-west-2
  instance_type = "t2.micro"
  tags = {
    Name = "EC2-Instance-US-West"
  }
}