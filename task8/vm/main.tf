locals {
  creds = yamldecode(file("../../cloud-key/iam.key"))
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config  = {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    region         = "ru-central1"
    bucket         = "paz-project-terraform-state-bucket"
    key            = "dev/vpc/terraform.tfstate"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true # Необходимая опция Terraform для версии 1.6.1 и старше.
    skip_s3_checksum            = true # Необходимая опция при описании бэкенда для Terraform версии 1.6.3 и старше.

    access_key = local.creds.access_key
    secret_key = local.creds.secret_key
   }
   depends_on = [ local.creds ]
 }

module "test-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.env_name
  network_id     = data.terraform_remote_state.vpc.outputs.vpc_tf8.network_id #[module.net.network.id]
  subnet_zones   = data.terraform_remote_state.vpc.outputs.vpc_tf8.subnet_zones #[module.net.subnet.zone]
  subnet_ids     = data.terraform_remote_state.vpc.outputs.vpc_tf8.subnet_ids #[module.net.subnet.id]
  instance_name  = "webs"
  instance_count = 2
  image_family   = var.default_image_family_name
  public_ip      = var.nat_flag

  labels = { 
    for k,v in var.labels_owner: k => v
  }

  metadata = {
    #user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = var.default_vm_metadata.serial-port-enable
  }
  #depends_on = [ terraform_remote_state.vpc ]
}

