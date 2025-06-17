terraform {
  backend "s3" {
    bucket         = "eks-terraform-state-doron"
    key            = "eks/terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "eks-terraform-lock"
  }
}

