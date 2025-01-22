# EC2 Instance 

resource "aws_instance" "server" {
    ami                 =       "ami-00bb6a80f01f03502"
    instance_type       =       "t2.micro"
    subnet_id           =       var.sn
    vpc_security_group_ids     =       [var.sg]

    tags                =       {
        Name            =       "myserver"
    }
}