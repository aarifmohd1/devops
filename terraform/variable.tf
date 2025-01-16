variable "os" {
    type = string
    default = "ami-053b12d3152c0cc71"
    description = "This is my AMI id"
}

variable "size" {
  default = "t2.micro"
}

variable "name" {
  default = "mywebserver"
}

variable "bucketname" {
  
}