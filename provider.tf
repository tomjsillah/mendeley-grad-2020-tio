##aws as a provider
provider "aws" {
  region = "eu-west-2"

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
    bucket  = "re-cares-backend"
    encrypt = true
    region  = "eu-west-2"
    key     = "re-cares/.tfstate"
  }
}


provider "kubernetes" {
}

module "common_values" {
  source = "git::ssh://git@github.com/elsevier-centraltechnology/rp-terraform-common-values?ref=3.4.0"
}


