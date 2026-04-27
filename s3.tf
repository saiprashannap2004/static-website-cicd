resource "aws_s3_bucket" "static_site" {
  bucket = "sai-static-site-bucket"   # must be globally unique
}

resource "aws_s3_bucket_website_configuration" "static_site_config" {
  bucket = aws_s3_bucket.static_site.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}
