resource "mongodbatlas_advanced_cluster" "this" {
  project_id             = var.atlas_project_id
  name                   = local.resource_name
  mongo_db_major_version = var.mongodb_major_version
  cluster_type           = local.cluster_type
  backup_enabled         = true

  replication_specs {
    num_shards = var.number_of_shards
    region_configs {
      auto_scaling {
        disk_gb_enabled = true
      }
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
      region_name   = local.atlas_region_name
    }
  }

  depends_on = [mongodbatlas_privatelink_endpoint_service.this]
}

locals {
  replica_set_list  = ["M10", "M20"]
  cluster_type      = contains(local.replica_set_list, var.cluster_tier) ? "REPLICASET" : "SHARDED"
  atlas_region_name = upper(replace(data.aws_region.this.name, "-", "_"))
  db_endpoint       = lookup(mongodbatlas_advanced_cluster.this.connection_strings[0].aws_private_link_srv, aws_vpc_endpoint.this.id)
  db_protocol       = split("://", local.db_endpoint)[0]
  db_port           = local.db_protocol == "mongodb+srv" ? 27016 : 27017
}

resource "mongodbatlas_database_user" "this" {
  project_id         = var.atlas_project_id
  username           = local.admin_username
  password           = local.admin_password
  auth_database_name = "admin"

  roles {
    database_name = "admin"
    role_name     = "atlasAdmin"
  }
}
