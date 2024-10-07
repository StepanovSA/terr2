### Виртуальная машина  netology-develop-platform-db
### network
variable "db_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_db_name" {
  type        = string
  default     = "prod"
  description = "VPC network & subnet name"
}

variable "db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

### VM
variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "имя машины"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v2"
  description = "Политика планирования"
}

variable "vm_db_cores" { 
  type        = string
  default     = "2"
  description = "Количество ядер"
}

variable "vm_db_memory" { 
  type        = string
  default     = "2"
  description = "Размер ОП"
}

variable "vm_db_core_fraction" {
  type        = string
  default     = "20"
  description = "Производительность CPU"
}
