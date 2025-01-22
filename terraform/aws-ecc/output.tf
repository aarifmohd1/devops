output "output_from_ec2_instance" {
  value  =  aws_instance.ec2_example.public_ip
}