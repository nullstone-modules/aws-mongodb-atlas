module "db_admin" {
  source  = "api.nullstone.io/nullstone/aws-mongo-db-admin/aws"
  version = "~> 0.1.0"

  name     = local.resource_name
  tags     = local.tags
  host     = local.db_host
  port     = local.db_port
  username = local.admin_username
  password = local.admin_password

  network = {
    vpc_id                  = local.vpc_id
    security_group_ids      = []
    mongo_security_group_id = aws_security_group.this.id
    subnet_ids              = local.private_subnet_ids
  }
}
