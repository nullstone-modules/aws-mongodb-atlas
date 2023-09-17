variable "atlas_project_id" {
  type        = string
  description = "The ID of the Atlas project to create the cluster in"
}

variable "atlas_public_key" {
  type        = string
  description = "The public key used to authenticate to your MongoDB Atlas account"
}

variable "atlas_private_key" {
  type        = string
  description = "The private key used to authenticate to your MongoDB Atlas account"
}

variable "mongodb_major_version" {
  type        = string
  default     = "6"
  description = "The version of MongoDB to use for the cluster"
}

variable "cluster_tier" {
  type        = string
  default     = "M10"
  description = <<EOF
The cluster tier to use. See https://www.mongodb.com/docs/atlas/sizing-tier-selection for more information on choosing the right sized instance.
Dedicated tiers available are M10, M20, M30, M40, M50, M60, M80, M140, M200, M300, M400, M700.
EOF
}

variable "number_of_shards" {
  type        = number
  default     = 1
  description = "The number of shards to create in the cluster"
}
