output "network" {
  value = yandex_vpc_network.network
}

output "subnet" {
  value = yandex_vpc_subnet.subnet
}

output "subnets" {
  value = var.subnets
}

output "network_id" {
  value = yandex_vpc_network.network.id
}

output "subnets_id" {
  value = yandex_vpc_subnet.subnet[*].id #[for i in yandex_vpc_network.develop: i.id if i != null ]
}
