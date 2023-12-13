output "env" {
  value = [
    {
      name  = "COGNITO_USER_POOL_ID"
      value = local.user_pool_id
    },
    {
      name  = "COGNITO_CLIENT_ID"
      value = local.client_id
    },
    {
      name  = "COGNITO_WEB_CLIENT_ID"
      value = local.web_client_id
    }
  ]
}

output "secrets" {
  value = [
    {
      name  = "COGNITO_ACCESS_KEY_ID"
      value = data.aws_secretsmanager_secret_version.access_key_id.secret_string
    },
    {
      name  = "COGNITO_SECRET_ACCESS_TOKEN"
      value = data.aws_secretsmanager_secret_version.secret_access_token.secret_string
    }
  ]
}
