######Виртуальная машина vm_web

resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family
}
resource "yandex_compute_instance" "platform" {
  name        = local.vm_name_web
  platform_id = var.vm_web_platform_id
  resources {
    cores         = var.vms_resources.vm_web_cores
    memory        = var.vms_resources.vm_web_memory
    core_fraction = var.vms_resources.vm_web_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}

###Виртуальная машина  netology-develop-platform-db

### Network
resource "yandex_vpc_network" "prod" {
  name = var.vpc_db_name
}
resource "yandex_vpc_subnet" "prod" {
  name           = var.vpc_db_name
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.prod.id
  v4_cidr_blocks = var.db_cidr
}


###VM

data "yandex_compute_image" "ubuntu_db" {
  family = var.vm_web_family
}
resource "yandex_compute_instance" "platform_db" {
  name        = local.vm_name_db
  platform_id = var.vm_db_platform_id
  zone        = "ru-central1-b"
  resources {
    cores         = var.vms_resources.vm_db_cores
    memory        = var.vms_resources.vm_db_memory
    core_fraction = var.vms_resources.vm_db_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.prod.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.metadata.serial-port-enable
    ssh-keys           = "ubuntu:${var.metadata.ssh_key}"
  }

}
