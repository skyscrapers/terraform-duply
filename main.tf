resource "aws_s3_bucket" "duply" {
    bucket = "${var.customer}-${var.project}-${var.environment}-backups"
    acl = "private"

    tags {
        Name = "${var.customer}-${var.project}-${var.environment}-backups"
        Environment = "${var.environment}"
        Customer = "${var.customer}"
        Project = "${var.project}"
    }
}

resource "aws_iam_access_key" "duply" {
    user = "${aws_iam_user.duply.name}"
}

resource "aws_iam_user" "duply" {
    name = "${var.customer}-duply"
    path = "/duply/"
}

resource "aws_iam_user_policy" "duply" {
    name = "backup_s3_access"
    user = "${aws_iam_user.duply.name}"
    policy = "${data.template_file.duply.rendered}"
}
