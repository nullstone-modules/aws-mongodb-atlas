# MongoDB Atlas 

This module creates a MongoDB cluster as a managed service on Mongo Atlas.
Mongo Atlas is a managed service offering provided by the creators of MongoDB.

## When to use

MongoDB Atlas is a great choice if you want to use MongoDB, but do not want to manage the cluster (e.g. uptime, backups, encryptions, etc.).
MongoDB, Inc. manages the servers, clusters, and sharding.

This requires a MongoDB Atlas account. Register for a new account [here](https://www.mongodb.com/cloud/atlas/register).

## Security & Compliance

Security scanning is graciously provided by [Bridgecrew](https://bridgecrew.io/).
Bridgecrew is the leading fully hosted, cloud-native solution providing continuous Terraform security and compliance.

![Infrastructure Security](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-mongodb-atlas/general)
![CIS AWS V1.3](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-mongodb-atlas/cis_aws_13)
![PCI-DSS V3.2](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-mongodb-atlas/pci)
![NIST-800-53](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-mongodb-atlas/nist)
![ISO27001](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-mongodb-atlas/iso)
![SOC2](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-mongodb-atlas/soc2)
![HIPAA](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-mongodb-atlas/hipaa)

## Secure Connection

This module creates a secure connection from your AWS network to the new MongoDB cluster.
As a result, the newly-created MongoDB cluster can only be accessed from your AWS network. 

It does so with a Private Link Endpoint. See the Mongo Atlas guide on [Private Link](https://www.mongodb.com/docs/atlas/security-cluster-private-endpoint/) for more information.

In order to establish this secure connection, an AWS VPC Endpoint from your AWS account is connected to a Mongo Atlas Private Link Endpoint.
This is the recommended and most secure way to connect to your Mongo Atlas cluster. It does make this module AWS specific.

## Logs

This module relies on the Atlas service for logs. See your provider to 
