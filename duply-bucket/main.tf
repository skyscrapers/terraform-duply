resource "aws_s3_bucket" "duply" {
  bucket = "${var.customer}-${var.project}-${var.environment}-backups"
  acl    = "private"

  tags {
    Name        = "${var.customer}-${var.project}-${var.environment}-backups"
    Environment = "${var.environment}"
    Customer    = "${var.customer}"
    Project     = "${var.project}"
  }
}
