resource "mgc_object_storage_buckets" "this" {
  bucket            = var.remote_backend.bucket
  bucket_is_prefix  = false
  enable_versioning = true
}