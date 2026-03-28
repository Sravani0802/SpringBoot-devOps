terraform {
  backend "s3" {
    bucket = "springboot-bucket-28032026"
    region = "ap-south-1"
    key = "backend/terraform.tfstate"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}

# terraform {
#   backend "local" {
#     path = "terraform.tfstate"
#   }
# }