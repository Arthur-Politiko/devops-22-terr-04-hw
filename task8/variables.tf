###cloud vars

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

variable "default_cidr_list" {
  type        = map(list(string))
  default     = { first = ["10.0.1.0/24"], second = ["10.0.2.0/24"] }
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "my-vpc-network"
  description = "VPC network&subnet name"
}

variable "default_vm_platform_name" {
  type        = string
  default     = "standard-v1"
  description = "https://yandex.cloud/ru/docs/compute/concepts/vm-platforms"
}

variable "default_image_family_name" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "https://cloud.yandex.ru/docs/compute/concepts/images"
}

variable "default_scheduling_policy_flag" {
  type        = bool
  default     = true
  description = "Preemptible VM"
}

variable "env_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "nat_flag" {
  type        = bool
  default     = true
  description = "NAT enable for subnet"
}


###

variable  "labels_owner" {
  type        = map(string)
  default     = { owner = "a.politiko", project = "my-best-terraform-project" }
  description = "Labels for resources"
}

variable "default_vm_metadata" {
  type = object({
    serial-port-enable = string
    user = string
    filepath = string
  })
  default = {
    filepath = "~/.ssh/id_ed25519.pub"
    user = "ubuntu"
    serial-port-enable = "1"
  }
}
