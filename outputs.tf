output "env" {
  value = [
    {
      name  = "COGNITO_USER_POOL_ID"
      value = local.user_pool_id
    },
    {
      name  = "COGNITO_CLIENT_ID"
      value = local.client_id
    }
  ]
}