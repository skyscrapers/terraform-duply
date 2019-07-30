module "bucket" {
  source      = "../duply-bucket"
  customer    = var.customer
  environment = var.environment
  project     = var.project
}

module "user" {
  source      = "../duply-user"
  customer    = var.customer
  environment = var.environment
  project     = var.project
  arn         = module.bucket.arn
}

