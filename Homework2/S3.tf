resource "aws_s3_bucket" "osptest" {
  bucket = "my-tf-osptest-bucket"
}

resource "aws_s3_bucket_acl" "osptest" {
  bucket = aws_s3_bucket.osptest.id
  acl    = "private"
}

resource "aws_s3_bucket" "log_bucket" {
  bucket = "my-tf-log-bucket"
}

resource "aws_s3_bucket_acl" "log_bucket_acl" {
  bucket = aws_s3_bucket.log_bucket.id
  acl    = "log-delivery-write"
}

resource "aws_s3_bucket_logging" "osptest" {
  bucket = aws_s3_bucket.osptest.id

  target_bucket = aws_s3_bucket.log_bucket.id
  target_prefix = "log/"
}