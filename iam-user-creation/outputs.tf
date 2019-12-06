output "user_name" {
    value = "${aws_iam_user.service-user.name}"
}

output "user_arn" {
    value = "${aws_iam_user.service-user.arn}"
}

output "user_policy" {
    value = "${aws_iam_user_policy.service-user-policy.name}"
}