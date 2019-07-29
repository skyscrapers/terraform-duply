resource "aws_iam_access_key" "duply" {
  user = aws_iam_user.duply.name
}

resource "aws_iam_user" "duply" {
  name = join(
    "-",
    compact([var.customer, var.environment, var.project, "duply"]),
  )
  path = "/duply/"
}

resource "aws_iam_user_policy" "duply" {
  name   = "backup_s3_access"
  user   = aws_iam_user.duply.name
  policy = data.template_file.duply.rendered
}

