resource "mgc_object_storage_buckets" "this" {
  bucket           = var.bucket_name
  bucket_is_prefix = false
  public_read      = true
}