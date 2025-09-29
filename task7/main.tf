provider "vault" {
    address          = var.vault.address #"https://127.0.0.1:8200"
    skip_tls_verify  = var.vault.skip_tls_verify #true
    token            = var.vault_token #"root"
}
provider "random" {}

resource "random_password" "passwords" {
  count = 4
  length  = 16
  special = true
}

data "vault_generic_secret" "vault_example"{
    path = "secret/example"
}

resource "vault_generic_secret" "generated_passwords" {
  path = "secret/generated-passwords"

  data_json = jsonencode({
    for i, password in random_password.passwords : "password_${i}" => password.result
  })
}

output "vault_example" {
    value = "${nonsensitive(data.vault_generic_secret.vault_example.data)}"
} 

output "token" {
    value = "${nonsensitive(var.vault_token)}"
} 

output "passwords" {
    value = "${nonsensitive(random_password.passwords.*.result)}"
    sensitive = true
}

