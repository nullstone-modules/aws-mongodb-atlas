output "db_instance_id" {
  value       = mongodbatlas_advanced_cluster.this.id
  description = "string ||| ID of the Mongo instance"
}

output "db_protocol" {
  value       = local.db_protocol
  description = "string ||| The protocol used to access the Mongo instance"
}

output "db_endpoint" {
  value       = local.db_endpoint
  description = "string ||| The endpoint URL to access the Mongo instance"
}

output "db_port" {
  value       = local.db_port
  description = "string ||| The port used to access the Mongo instance"
}

output "db_security_group_id" {
  value       = aws_security_group.this.id
  description = "string ||| The ID of the security group attached to the Mongo instance"
}

output "db_admin_secret_id" {
  value       = aws_secretsmanager_secret.password.name
  description = "string ||| The name of the secret in AWS Secrets Manager containing the password"
}

output "atlas_public_key_secret_id" {
  value       = local.atlas_public_key_secret_id
  description = "The public key used to authenticate to your MongoDB Atlas account"
}

output "atlas_private_key_secret_id" {
  value       = local.atlas_private_key_secret_id
  description = "The private key used to authenticate to your MongoDB Atlas account"
}

output "atlas_project_id" {
  value       = local.atlas_project_id
  description = "string ||| The ID of the Atlas project"
}

output "atlas_private_link_id" {
  value       = local.private_link_id
  description = "string ||| The ID of the Atlas private link"
}
