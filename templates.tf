data "template_file" "duply" {
    template = "${file("${path.module}/templates/duply-policy.tpl")}"
    vars {
        arn = "${aws_s3_bucket.duply.arn}"
    }
}
