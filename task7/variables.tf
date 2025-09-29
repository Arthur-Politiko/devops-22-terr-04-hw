variable "vault_token" {
  description = "Vault token"
  type        = string
  #sensitive   = true
}

variable "vault" {
    description = "Vault provider configuration"
    type        = object({
        address          = string
        skip_tls_verify  = bool
        token            = string
    })
    default = {
        address          = "https://127.0.0.1:8200"
        skip_tls_verify  = true
        token            = "education"
    }
}

