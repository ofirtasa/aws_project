resource "aws_secretsmanager_secret" "db_password" {
  name = "db-password"
  description = "RDS MySQL password"
}

resource "aws_secretsmanager_secret_version" "db_password_version" {
  secret_id     = aws_secretsmanager_secret.db_password.id
  secret_string = var.db_password
}
