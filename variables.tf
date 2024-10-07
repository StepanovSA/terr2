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

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGgv34Dc4MvT61kHWufVXBPGAqknztvtDTwRxeD4b8E/ root@vm-2"
  description = "ssh-keygen -t ed25519"
}

###var
variable "vm_web_family" { 
  type        = string
  default     = "ubuntu-2004-lts"
  description = "ОС"
}
variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "Имя ВМ"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v2"
  description = "политика планирования"
}

variable "vm_web_cores" { 
  type        = string
  default     = "2"
  description = "Количество ядер"
}

variable "vm_web_memory" { 
  type        = string
  default     = "2"
  description = "Размер ОП"
}

variable "vm_web_core_fraction" { 
  type        = string
  default     = "5"
  description = "Производительность CPU"
}

###Объявленные переменные для locals

variable "prod" {
  type = string
  default = "platform" 
}

variable "last_name" {
  type = list
  default = ["web","db"]
}

###Единая map-переменная vms_resources

variable "vms_resources" {
  type = map(string)
  default = {vm_web_cores="2",vm_web_memory="2",vm_web_core_fraction="5"
  vm_db_cores="2",vm_db_memory="2",vm_db_core_fraction="20"}
}

###Отдельная map(object) переменная для блока metadata, она должна быть общая для всех ВМ

variable "metadata" {
  type = map(string)
  default = {ssh_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGgv34Dc4MvT61kHWufVXBPGAqknztvtDTwRxeD4b8E/ root@vm-2",
  serial-port-enable = "1"} 
  }

