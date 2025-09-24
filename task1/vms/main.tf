#создаем облачную сеть
resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

#создаем подсеть
resource "yandex_vpc_subnet" "develop_a" {
  name           = "develop-ru-central1-a"
  zone           = var.default_zone_list.a
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr_list.first
}

resource "yandex_vpc_subnet" "develop_b" {
  name           = "develop-ru-central1-b"
  zone           = var.default_zone_list.b
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr_list.second
}

#создаем ВМ
module "test-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "develop" 
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = [yandex_vpc_subnet.develop_a.zone, yandex_vpc_subnet.develop_b.zone]#[for i in var.default_zone_list: i] #["ru-central1-a","ru-central1-b"]
  subnet_ids     = [yandex_vpc_subnet.develop_a.id,yandex_vpc_subnet.develop_b.id]
  instance_name  = "webs"
  instance_count = 2
  image_family   = var.default_image_family_name
  public_ip      = var.nat_flag

  labels = { 
    for k,v in var.labels_owner: k => v
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = var.default_vm_metadata.serial-port-enable
  }

}

module "example-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "stage"
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = [yandex_vpc_subnet.develop_a.zone]
  subnet_ids     = [yandex_vpc_subnet.develop_a.id]
  instance_name  = "web-stage"
  instance_count = 1
  image_family   = var.default_image_family_name
  public_ip      = var.nat_flag

  metadata = {
    #user-data          = templatefile(var.yaml_config_file, var.public_keys ) # Можно и так
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = var.default_vm_metadata.serial-port-enable
  }

}

#Пример передачи cloud-config в ВМ для демонстрации №3
data "template_file" "cloudinit" {
  #template = file("./cloud-init.yml")
  template = templatefile(var.yaml_config_file, {
    user_name = var.default_vm_metadata.user
    ssh_keys = var.public_keys 
  })
}


