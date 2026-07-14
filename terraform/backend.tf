terraform {
  backend "s3" {
    bucket         = "employee-management-dev-terraform-state"
    key            = "dev/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "employee-management-dev-terraform-lock"
    encrypt        = true
  }
}
