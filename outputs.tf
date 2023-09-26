output "db_instance_id" {
  value       = mongodbatlas_advanced_cluster.this.id
  description = "string ||| ID of the Mongo instance"
}

output "db_endpoint" {
  value       = local.db_endpoint
  description = "string ||| The endpoint URL to access the Mongo instance"
}

output "db_security_group_id" {
  value       = aws_security_group.this.id
  description = "string ||| The ID of the security group attached to the Mongo instance"
}

output "db_admin_secret_id" {
  value       = aws_secretsmanager_secret.password.name
  description = "string ||| The name of the secret in AWS Secrets Manager containing the password"
}

output "db_admin_function_name" {
  value       = module.db_admin.function_name
  description = "string ||| AWS Lambda Function name for database admin utility"
}

output "atlas_project_id" {
  value       = var.atlas_project_id
  sensitive   = true
  description = "string ||| The ID of the Atlas project"
}