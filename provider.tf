terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
 cloud_id  = var.yandex_cloud_id
 folder_id = var.yandex_folder_id
 zone      = var.b-zone
}
