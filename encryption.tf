resource "aws_kms_key" "this" {
  description         = "Encryption key for Mongo DB ${local.resource_name}"
  enable_key_rotation = true
  is_enabled          = true
  tags                = local.tags
}
