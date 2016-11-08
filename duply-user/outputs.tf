output "access_key" {
  value = "${aws_iam_access_key.duply.id}"
}

output "secret_key" {
  value = "${aws_iam_access_key.duply.secret}"
}
