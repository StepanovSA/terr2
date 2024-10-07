### Описать имя каждой ВМ переменными netology-develop-platform-db и netology-develop-platform-web
locals {
  vm_name_web = "netology-${var.vpc_name}-${var.prod}-${var.last_name[0]}"
  vm_name_db = "netology-${var.vpc_name}-${var.prod}-${var.last_name[1]}"
}

###В файле var объявляю дополнительные переменные prod и last_name
