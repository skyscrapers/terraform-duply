data "template_file" "duply" {
  template = "${file("${path.module}/templates/duply-policy.tpl")}"

  vars {
    arn = "${var.arn}"
  }
}
