resource "aws_instance" "webserver" {
    ami     =       var.os
    instance_type = var.size

    tags = {
        Name    =   var.name
    }
  
}

resource "aws_s3_bucket" "bucket_of_asad" {
    bucket = var.bucketname
}
# resource "github_repository" "myterraform_repo" {
#     name    =   "myterraform_repo"
#     description =   "Terraform Created"

#     visibility  =   "public"
  
# }

