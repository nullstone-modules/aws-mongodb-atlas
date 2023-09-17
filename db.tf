resource "mongodbatlas_advanced_cluster" "this" {
  project_id   = var.atlas_project_id
  name         = local.resource_name
  cluster_type = "REPLICASET"
  replication_specs {
    region_configs {
      mongodb_major_version = var.mongodb_major_version
      num_shards = var.number_of_shards
      cloud_backup = true
      auto_scaling_disk_gb_enabled = true
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
