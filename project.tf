data "ns_connection" "atlas-project" {
  name     = "atlas-project"
  contract = "network/aws/mongo:atlas"
}

locals {
  atlas_project_id = data.ns_connection.atlas-project.outputs.project_id
  private_link_id = data.ns_connection.atlas-project.outputs.private_link_id
  atlas_public_key_secret_id = data.ns_connection.atlas-project.outputs.atlas_public_key_secret_id
  atlas_private_key_secret_id = data.ns_connection.atlas-project.outputs.atlas_private_key_secret_id
}

data "aws_secretsmanager_secret_version" "atlas_public_key" {
  secret_id = local.atlas_public_key_secret_id
}
data "aws_secretsmanager_secret_version" "atlas_private_key" {
  secret_id = local.atlas_private_key_secret_id
}
