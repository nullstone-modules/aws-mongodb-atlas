provider "mongodbatlas" {
  public_key  = var.atlas_public_key
  private_key = var.atlas_private_key
}

resource "aws_secretsmanager_secret" "atlas_public_key" {
  name_prefix = "${local.block_name}/atlas_public_key/"
  tags        = local.tags
  kms_key_id  = aws_kms_key.this.arn

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_secretsmanager_secret_version" "atlas_public_key" {
  secret_id     = aws_secretsmanager_secret.atlas_public_key.id
  secret_string = var.atlas_public_key

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_secretsmanager_secret" "atlas_private_key" {
  name_prefix = "${local.block_name}/atlas_private_key/"
  tags        = local.tags
  kms_key_id  = aws_kms_key.this.arn

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_secretsmanager_secret_version" "atlas_private_key" {
  secret_id     = aws_secretsmanager_secret.atlas_private_key.id
  secret_string = var.atlas_private_key

  lifecycle {
    create_before_destroy = true
  }
}
