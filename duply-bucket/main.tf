resource "aws_s3_bucket" "duply" {
  bucket = join(
    "-",
    compact([var.customer, var.project, var.environment, "backups"]),
  )
  acl = "private"

  tags = {
    Name = join(
      "-",
      compact([var.customer, var.project, var.environment, "backups"]),
    )
    Environment = var.environment
    Customer    = var.customer
    Project     = var.project
  }
}

