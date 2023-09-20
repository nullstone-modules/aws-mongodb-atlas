resource "mongodbatlas_privatelink_endpoint" "this" {
  project_id    = var.atlas_project_id
  provider_name = "AWS"
  region        = data.aws_region.this.name
}

resource "aws_vpc_endpoint" "this" {
  vpc_id             = local.vpc_id
  service_name       = mongodbatlas_privatelink_endpoint.this.endpoint_service_name
  vpc_endpoint_type  = "Interface"
  subnet_ids         = local.private_subnet_ids
  security_group_ids = [aws_security_group.this.id]

  tags = local.tags
}

resource "mongodbatlas_privatelink_endpoint_service" "this" {
  project_id          = var.atlas_project_id
  private_link_id     = mongodbatlas_privatelink_endpoint.this.private_link_id
  endpoint_service_id = aws_vpc_endpoint.this.id
  provider_name       = "AWS"
}
