provider "aws" {
  region  = "us-west-2"
  profile = "testing/shannon"
}

resource "aws_iam_user" "service-user" {
  name = "${var.name}"
}

data "aws_iam_policy_document" "service-user-policy-document" {
  statement {
    actions   = "${var.actions}"
    resources = "${var.resources}"
  }
}

resource "aws_iam_user_policy" "service-user-policy" {
    name = "${aws_iam_user.service-user.name}-policy"
    user = "${aws_iam_user.service-user.name}"
    policy = "${data.aws_iam_policy_document.service-user-policy-document.json}"
}

