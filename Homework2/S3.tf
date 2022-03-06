resource "aws_s3_bucket" "web-log" {
  bucket = "my-tf-web-log-bucket"
}

resource "aws_s3_bucket_acl" "web-log" {
  bucket = aws_s3_bucket.web-log.id
  acl    = "private"
}

