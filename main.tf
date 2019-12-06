provider "aws" {
  region  = "us-west-2"
  profile = "testing/shannon"
}

module "iam-test" {
  source = "./iam-user-creation"

  name = "shannon-s3-test"

  resources = [
    "arn:aws:s3:::shannon-tf-test-2",
    "arn:aws:s3:::shannon-tf-test-1",
  ]

  actions = [
    "s3:*",
  ]
}
