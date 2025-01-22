terraform {
  backend "s3" {
    bucket = "aarif-terraform-bucket"
    key = "terraform.tfstate"
    region = "ap-south-1"
  }
}

resource "aws_instance" "ec2_example" {
  ami = "ami-07b69f62c1d38b012"
  instance_type = "t2.micro"
  subnet_id = "subnet-0eb4e928065f134ba"
  tags = {
    Name  = "Terraform EC4"
  }
  
}


data "aws_instance" "mynewinstance" {
  filter {
    name  = "tag:Name"
    values = [
      "Terraform EC4"
      ]
  }
 depends_on = [ aws_instance.ec2_example ] 
}

