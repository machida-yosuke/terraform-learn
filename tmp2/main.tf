terraform {
  required_version = ">=0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">3.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

module "web_server" {
  source = "./modules/nginx_server"
  instance_type = "t2.micro"
}

output "web_server_id" {
  value = module.web_server.instance_id
}