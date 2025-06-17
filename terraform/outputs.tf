output "website_endpoint" {
  value = aws_s3_bucket.static_site.website_endpoint
  description = "The public endpoint of the static website"
}
