resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket-amit"
  acl    = "private"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}