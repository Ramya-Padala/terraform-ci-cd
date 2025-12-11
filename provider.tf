#This Terraform Code Deploys Basic VPC Infra.
provider "aws" {
  region = var.aws_region
}

provider "tls" {}
provider "azurerm" {
  features {}
}

terraform {
  required_version = "1.8.2"
  required_providers {
    aws = {
      version = "<= 6.0.0"
      source  = "hashicorp/aws"
    }
    tls = {
      version = "<= 4.0.5"
      source  = "hashicorp/tls"
    }
    azurerm = {
      version = "<= 3.5.0"
      source  = "hashicorp/azurerm"
    }
  }
  backend "s3" {
    bucket = "awsb58.xyz"
    key    = "awsb58tfstate"
    region = "us-east-1"
  }
}