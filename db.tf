resource "mongodbatlas_advanced_cluster" "this" {
  project_id             = var.atlas_project_id
  name                   = local.resource_name
  mongo_db_major_version = var.mongodb_major_version
  cluster_type           = "SHARDED"
  backup_enabled         = true

  replication_specs {
    num_shards = var.number_of_shards
    region_configs {
      electable_specs {
        instance_size = var.cluster_tier
        node_count    = 3
      }
      analytics_specs {
        instance_size = var.cluster_tier
        node_count    = 1
      }
      provider_name = "AWS"
      priority      = 7
      region_name   = data.aws_region.this.name
    }
  }
}

# Container example provided but not always required,
# see network_container documentation for details.
resource "mongodbatlas_network_container" "this" {
  project_id       = var.atlas_project_id
  atlas_cidr_block = "10.8.0.0/21"
  provider_name    = "AWS"
  region_name      = data.aws_region.this.name
}

# Create the peering connection request
resource "mongodbatlas_network_peering" "this" {
  accepter_region_name   = data.aws_region.this.name
  project_id             = var.atlas_project_id
  container_id           = mongodbatlas_advanced_cluster.this.replication_specs[0].container_id
  provider_name          = "AWS"
  route_table_cidr_block = "192.168.0.0/24"
  vpc_id                 = local.vpc_id
  aws_account_id         = data.aws_caller_identity.this.account_id
}

# Accept the peering connection request
resource "aws_vpc_peering_connection_accepter" "peer" {
  vpc_peering_connection_id = mongodbatlas_network_peering.this.connection_id
  auto_accept               = true
}
