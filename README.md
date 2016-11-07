# terraform-duply

Terraform modules to set up a the different parts for S3 based duply backups.

Contents:
* duply-bucket: primitive to create backup bucket
* duply-user: create an IAM backup user
* duply-bucket-iamuser: abstraction creating both the bucket and user in a single module.

## duply-bucket

Create the bucket to store the backups.

### Available variables:
 * [`customer`]: String(required): Name of the customer
 * [`project`]: String(optional): The name of the project, default "noproject"
 * [`environment`]: String(optional): The name of the environment, default "production"

### Output
 * [`arn`]: String: The ARN of the S3 bucket to hold the backups.

### Example
  ```
  module "backup_bucket" {
    source        = "github.com/skyscrapers/terraform-duply//duply-bucket"
    customer      = "my_customer"
    project       = "my_funky_app"
    environment   = "staging"
  }
  ```

## duply-user

Create the backup user.

### Available variables:
 * [`customer`]: String(required): Name of the customer
 * [`arn`]: String(required): The ARN of the bucket that needs to be managed by the backup user.

### Output
 * [`access_key`]: String: The AWS access key for the created backup user
 * [`secret_name`]: String: The name of the ELB

### Example
  ```
  module "backup_user" {
    source        = "github.com/skyscrapers/terraform-duply//duply-user"
    customer      = "my_customer"
    arn           = "${aws_s3_bucket.backup.arn}"
  }
  ```

## duply-bucket-iamuser

Create the bucket and the user in a single go.

### Available variables:
 * [`customer`]: String(required): Name of the customer
 * [`project`]: String(optional): The name of the project, default "noproject"
 * [`environment`]: String(optional): The name of the environment, default "production"

### Output
 * [`access_key`]: String: The AWS access key for the created backup user
 * [`secret_name`]: String: The name of the ELB

### Example
  ```
  module "backup_setup" {
    source        = "github.com/skyscrapers/terraform-duply//duply-bucket-iamuser"
    customer      = "my_customer"
    project       = "my_funky_app"
    environment   = "staging"
  }
  ```
