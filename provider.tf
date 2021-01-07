##aws as a provider
provider "aws" {
  region = "us-east-2"

}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

#cluster provider
terraform {
  backend "s3" {
    bucket  = "re-cares"
    encrypt = true
    region  = "us-east-2"
    key     = "re-cares/.tfstate"
  }
}


provider "kubernetes" {
}


