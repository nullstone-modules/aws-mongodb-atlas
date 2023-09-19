output "db_instance_id" {
  value = mongodbatlas_advanced_cluster.this.id
}

output "db_endpoint" {
  value = mongodbatlas_advanced_cluster.this.connection_strings.private
}
