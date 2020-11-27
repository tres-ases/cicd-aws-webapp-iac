resource "aws_cloudfront_origin_access_identity" "cosmos_origin_access_identity" {
  comment = "Identity for cosmos"
}
resource "aws_cloudfront_distribution" "cosmos_distribution" {
  origin {
    domain_name = aws_s3_bucket.cosmos-bucket-front.bucket_regional_domain_name
    origin_id   = aws_cloudfront_origin_access_identity.cosmos_origin_access_identity.id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.cosmos_origin_access_identity.cloudfront_access_identity_path
    }
  }
  origin {
    domain_name = var.first_time ? "noconfigure.execute-api.${var.region}.amazonaws.com" : "${data.aws_ssm_parameter.apigw-id.0.value}.execute-api.${var.region}.amazonaws.com" 
    origin_id   = "cosmos-apigw"
    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "https-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }
  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Some comment"
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = aws_cloudfront_origin_access_identity.cosmos_origin_access_identity.id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }
  ordered_cache_behavior {
    path_pattern           = "/api*"
    allowed_methods        = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
    cached_methods         = ["HEAD", "GET"]
    compress               = true
    min_ttl                = 0
    default_ttl            = 0
    max_ttl                = 0
    target_origin_id       = "cosmos-apigw"
    viewer_protocol_policy = "redirect-to-https"
    forwarded_values {
      headers      = ["Authorization"]
      query_string = true
      cookies {
        forward = "none"
      }
    }
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  tags = {
    Name = "cosmos-distribution"
  }
  custom_error_response {
    error_code         = 403
    response_code      = 200
    response_page_path = "/index.html"
  }
  price_class = "PriceClass_All"
  viewer_certificate {
    cloudfront_default_certificate = true
    ssl_support_method = "sni-only"
  }
}


