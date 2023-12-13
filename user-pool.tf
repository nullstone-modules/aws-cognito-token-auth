data "ns_connection" "user-pool" {
  name     = "user-pool"
  contract = "datastore/aws/cognito"
}

locals {
  user_pool_id  = data.ns_connection.user-pool.outputs.user_pool_id
  client_id     = data.ns_connection.user-pool.outputs.client_id
  web_client_id = data.ns_connection.user-pool.outputs.web_client_id
  access_key_id_secret_id = data.ns_connection.user-pool.outputs.access_key_id_secret_id
  secret_access_token_secret_id = data.ns_connection.user-pool.outputs.secret_access_token_secret_id
}

data "aws_secretsmanager_secret_version" "access_key_id" {
  secret_id = local.access_key_id_secret_id
}

data "aws_secretsmanager_secret_version" "secret_access_token" {
  secret_id = local.secret_access_token_secret_id
}
