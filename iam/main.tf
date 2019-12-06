provider "aws" {
  region  = "us-west-2"
  profile = "testing/shannon"
}

resource "aws_iam_user" "new-user" {
  name = "shannonlucas"
}

# resource "aws_iam_access_key" "new-user" {
#   user = "${aws_iam_user.new-user.name}"
# }

resource "aws_iam_user_policy" "new-user-policy" {
  name = "test-policy"
  user = "${aws_iam_user.new-user.name}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_user" "s3-service-user" {
  name = "s3-service-user"
}

resource "aws_iam_user_policy" "s3-user-policy" {
  name = "test-policy"
  user = "${aws_iam_user.s3-service-user.name}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1575593371615",
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::shannon-tf-test-1"
    },
    {
      "Sid": "Stmt1575593384201",
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::shannon-tf-test-2"
    }
  ]
}
EOF
}

output "arn" {
  value = "${aws_iam_user.s3-service-user.arn}"
}
