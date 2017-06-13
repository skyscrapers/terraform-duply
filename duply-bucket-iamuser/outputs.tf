output "access_key" {
  value = "${module.user.access_key}"
}

output "secret_key" {
  value = "${module.user.secret_key}"
}

output "arn" {
  value = "${module.bucket.arn}"
}
