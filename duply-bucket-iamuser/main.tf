module "bucket" {
  source   = "../duply-bucket"
  customer = "${var.customer}"
}

module "user" {
  source   = "../duply-user"
  customer = "${var.customer}"
  arn      = "${module.bucket.arn}"
}
