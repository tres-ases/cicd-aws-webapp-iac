resource "aws_s3_bucket" "cosmos-cf-templates" {
  bucket = "cosmos-cf-templates-${var.stage}"
  acl    = "private"
}
