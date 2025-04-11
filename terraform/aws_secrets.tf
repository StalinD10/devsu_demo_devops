
resource "aws_secretsmanager_secret" "terraform_vars" {
  name        = "prod/terraform/tfvars"
  description = "Sensity Variables"
}

resource "aws_secretsmanager_secret_version" "terraform_vars" {
  secret_id     = aws_secretsmanager_secret.terraform_vars.id
  secret_string = file("${path.module}/terraform.tfvars")
}