resource "aws_s3_bucket" "cosmos-cf-templates" {
  bucket = "cosmos-cf-templates-${var.stage}"
  acl    = "private"
}
## FRONTEND
data "aws_iam_policy_document" "cosmos_s3_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.cosmos-bucket-front.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.cosmos_origin_access_identity.iam_arn]
    }
  }
}
resource "aws_s3_bucket" "cosmos-bucket-front" {
  bucket = "cosmos-${var.stage}-front"
  acl    = "private"
}
resource "aws_s3_bucket_policy" "cosmos-bucket-policy" {
  bucket = aws_s3_bucket.cosmos-bucket-front.id
  policy = data.aws_iam_policy_document.cosmos_s3_policy.json
}

