resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("C:\\Users\\AarifMohd\\.ssh\\id_ed25519.pub")
}

resource "aws_instance" "ec2_example" {

    ami           = "ami-04b4f1a9cf54c11d0"  
    instance_type = "t2.micro" 
    key_name      = aws_key_pair.deployer.key_name
    vpc_security_group_ids = [aws_security_group.main.id]

  provisioner "remote-exec" {
    inline = [
      "touch hello.txt",
      "echo helloworld remote provisioner >> hello.txt",
    ]
  }
  connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("C:\\Users\\AarifMohd\\.ssh\\id_ed25519")
      timeout     = "4m"
   }
}

resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
 ingress                = [
   {
     cidr_blocks      = [ "0.0.0.0/0", ]
     description      = ""
     from_port        = 22
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
     to_port          = 22
  }
  ]
}
