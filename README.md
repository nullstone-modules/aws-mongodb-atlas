This module creates a MongoDB cluster as a managed service on Mongo Atlas.

## Secure Connection
With this module, a secure connection is established from your AWS network to the cluster running on Mongo Atlas.
It does so with a Private Link Endpoint. See the Mongo Atlas guide on [Private Link](https://www.mongodb.com/docs/atlas/security-cluster-private-endpoint/) for more information.

In order to establish this secure connection, an AWS VPC Endpoint from your AWS account is connected to a Mongo Atlas Private Link Endpoint.
This is the recommended and most secure way to connect to your Mongo Atlas cluster. It does make this module AWS specific.