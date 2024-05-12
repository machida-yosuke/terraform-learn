terraform {
  required_version = ">= 0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.0"
    }
  }


  # backend "s3" {
  #   bucket  = "tasty-log-tfstate-bucket-machida"
  #   key     = "tastylog-dev.tfstate"
  #   region  = "ap-northeast-1"
  #   profile = "terraform-udemy"
  # }
}

provider "aws" {
  region = "ap-northeast-1"
}

provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}


variable "project" {
  type = string
}

variable "environment" {
  type = string
}

variable "domain" {
  type = string
}