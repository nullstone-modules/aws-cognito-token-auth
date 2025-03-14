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

locals {
  cognito_secrets = {
    "COGNITO_CLIENT_SECRET"     = try(data.aws_secretsmanager_secret_version.client_secret[0].secret_string, "")
    "COGNITO_ACCESS_KEY_ID"     = try(data.aws_secretsmanager_secret_version.access_key_id[0].secret_string, "")
    "COGNITO_SECRET_ACCESS_KEY" = try(data.aws_secretsmanager_secret_version.secret_access_key[0].secret_string, "")
  }
}

output "secrets" {
  value = [for k, v in local.cognito_secrets : { name = k, value = v } if v != ""]
}
