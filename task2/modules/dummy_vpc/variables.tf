variable "description" {
  type = string
  default = "Dummy module just for VPC and Subnets"
}

variable "labels" {
  description = "for dynamic block 'labels' "
  type        = map(string)
  default = {}
}

variable "env_name" {
  type    = string
  default = null
  description = "Environment name for labeling"
}

variable "network_name" {
  type = string
  description = "VPC network name"
}

variable "subnet_cidrs" {
  type = list(string)
  default = []
  description = "List of subnet CIDR blocks"
}

variable "subnet_names" {
  type = list(string)
  default = []
  description = "List of subnet names"
}

variable "subnet_zones" {
  type = list(string)
  default = []
  description = "List of zones for subnetworks"
}

# Add default value for subnets variable just for testing
variable "subnets" {
  type = list(object({zone = string, cidr = list(string)}))
  default = [ 
    { zone = "ru-central1-a", cidr = ["10.0.1.0/24"] },
   ]
  description = "List of subnetworks"
}
