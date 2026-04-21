resource "aws_ecr_repository" "springboot_repo" {
  name = "springboot-devops-app"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Environment = "dev"
  }
}