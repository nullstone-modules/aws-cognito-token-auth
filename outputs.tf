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
      name  = "COGNITO_IDENTITY_POOL_ID"
      value = local.identity_pool_id
    }
  ]
}

output "secrets" {
  value = [
    {
      name  = "COGNITO_CLIENT_SECRET"
      value = try(data.aws_secretsmanager_secret_version.client_secret[0].secret_string, "")
    },
    {
      name  = "COGNITO_ACCESS_KEY_ID"
      value = data.aws_secretsmanager_secret_version.access_key_id.secret_string
    },
    {
      name  = "COGNITO_SECRET_ACCESS_KEY"
      value = data.aws_secretsmanager_secret_version.secret_access_key.secret_string
    }
  ]
}
