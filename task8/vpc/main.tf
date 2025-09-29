module "vpc_pro" {
    source = "../modules/dummy_vpc"
    network_name = "prod-vpc-network"
    subnets = [
      {zone = "ru-central1-a", cidr = ["10.0.11.0/24"]},
      {zone = "ru-central1-b", cidr = ["10.0.22.0/24"]}
    ]
}

module "vpc_dev" {
    source = "../modules/dummy_vpc"
    network_name = "develop-vpc-network"
    subnets = [
      {zone = "ru-central1-a", cidr = ["10.0.1.0/24"]},
      {zone = "ru-central1-b", cidr = ["10.0.2.0/24"]}
    ]
}

output "vpc_tf8" {
  description = "Nessesary subnet parameters for VM module"
  value = {
    network_id = module.vpc_dev.network.id
    subnet_zones = module.vpc_dev.subnet[*].zone
    subnet_ids = module.vpc_dev.subnet[*].id
  }
}