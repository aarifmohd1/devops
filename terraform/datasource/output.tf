output "output_from_ec2_instance" {
  value  =   data.aws_instance.mynewinstance.id
}