variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone_list" {
  type        = map(string)
  default     = {a = "ru-central1-a", b = "ru-central1-b" }
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
