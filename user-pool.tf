data "ns_connection" "user-pool" {
  name     = "user-pool"
  contract = "datastore/aws/cognito"
}

locals {
  user_pool_id = data.ns_connection.user-pool.outputs.user_pool_id
  client_id = data.ns_connection.user-pool.outputs.client_id
}
