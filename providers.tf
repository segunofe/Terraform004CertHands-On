provider "aws" {
  region  = "us-east-1"
  profile = "default" # the access key and secret key are stored in the default profile of the AWS CLI

  default_tags {
    tags = {
      "Automation"  = "terraform"
      "Environment" = "test"
      "Project"     = "webapp"
    }
  }

}


























