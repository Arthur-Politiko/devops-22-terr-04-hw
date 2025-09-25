module "vpc_pro" {
    source = "./modules/dummy_vpc"
    network_name = "prod-vpc-network"
    subnets = [
      {zone = "ru-central1-a", cidr = ["10.0.11.0/24"]},
      {zone = "ru-central1-b", cidr = ["10.0.22.0/24"]}
    ]
}

module "vpc_dev" {
    source = "./modules/dummy_vpc"
    network_name = "develop-vpc-network"
    subnets = [
      {zone = "ru-central1-a", cidr = ["10.0.1.0/24"]},
      {zone = "ru-central1-b", cidr = ["10.0.2.0/24"]}
    ]
}

module "test-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.env_name
  network_id     = module.vpc_dev.network.id
  subnet_zones   = module.vpc_dev.subnet[*].zone #[module.net.subnet.zone] 
  subnet_ids     = module.vpc_dev.subnet[*].id #[module.net.subnet.id]
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
  depends_on = [ module.vpc_dev ]
}
