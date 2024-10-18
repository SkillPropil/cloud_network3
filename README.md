# cloud_network3
## Задание 1 Yandex Cloud
Создал бакет и зашифровал содержимое  
Конфиг в репозитории  

<img width="1182" alt="Снимок экрана 2024-10-18 в 15 55 50" src="https://github.com/user-attachments/assets/aa461314-ebd5-4de6-89d1-5347754d60c1">  

```
[root@skillpropilserv-01 cloud-networks3-local]# terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions
are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # yandex_iam_service_account.bucket-sa-a will be created
  + resource "yandex_iam_service_account" "bucket-sa-a" {
      + created_at = (known after apply)
      + folder_id  = (known after apply)
      + id         = (known after apply)
      + name       = "bucket-sa-a"
    }

  # yandex_iam_service_account_static_access_key.sa-static-key will be created
  + resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
      + access_key                   = (known after apply)
      + created_at                   = (known after apply)
      + description                  = "static access key for bucket-sa object storage"
      + encrypted_secret_key         = (known after apply)
      + id                           = (known after apply)
      + key_fingerprint              = (known after apply)
      + output_to_lockbox_version_id = (known after apply)
      + secret_key                   = (sensitive value)
      + service_account_id           = (known after apply)
    }

  # yandex_kms_symmetric_key.key-a will be created
  + resource "yandex_kms_symmetric_key" "key-a" {
      + created_at          = (known after apply)
      + default_algorithm   = "AES_128"
      + deletion_protection = false
      + description         = "Ключ для шифрования бакета"
      + folder_id           = (known after apply)
      + id                  = (known after apply)
      + name                = "netology-key"
      + rotated_at          = (known after apply)
      + rotation_period     = "8760h"
      + status              = (known after apply)
    }

  # yandex_resourcemanager_folder_iam_member.sa-editor will be created
  + resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
      + folder_id = "b1g73kf911qh20t72eeb"
      + id        = (known after apply)
      + member    = (known after apply)
      + role      = "editor"
    }

  # yandex_storage_bucket.bucket-for-web-1 will be created
  + resource "yandex_storage_bucket" "bucket-for-web-1" {
      + access_key            = (known after apply)
      + acl                   = "public-read"
      + bucket                = "skillpropil-netology-bucket"
      + bucket_domain_name    = (known after apply)
      + default_storage_class = (known after apply)
      + folder_id             = (known after apply)
      + force_destroy         = false
      + id                    = (known after apply)
      + secret_key            = (sensitive value)
      + website_domain        = (known after apply)
      + website_endpoint      = (known after apply)

      + anonymous_access_flags {
          + list = false
          + read = true
        }

      + server_side_encryption_configuration {
          + rule {
              + apply_server_side_encryption_by_default {
                  + kms_master_key_id = (known after apply)
                  + sse_algorithm     = "aws:kms"
                }
            }
        }

      + versioning (known after apply)

      + website {
          + error_document = "error.html"
          + index_document = "index.html"
        }
    }

  # yandex_storage_object.error will be created
  + resource "yandex_storage_object" "error" {
      + access_key   = (known after apply)
      + acl          = "private"
      + bucket       = (known after apply)
      + content_type = (known after apply)
      + id           = (known after apply)
      + key          = "error.html"
      + secret_key   = (sensitive value)
      + source       = "./site/error.html"
    }

  # yandex_storage_object.index will be created
  + resource "yandex_storage_object" "index" {
      + access_key   = (known after apply)
      + acl          = "private"
      + bucket       = (known after apply)
      + content_type = (known after apply)
      + id           = (known after apply)
      + key          = "index.html"
      + secret_key   = (sensitive value)
      + source       = "./site/index.html"
    }

Plan: 7 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

yandex_kms_symmetric_key.key-a: Creating...
yandex_iam_service_account.bucket-sa-a: Creating...
yandex_kms_symmetric_key.key-a: Creation complete after 0s [id=abjireovleoc1u9h4hol]
yandex_iam_service_account.bucket-sa-a: Creation complete after 2s [id=ajesqq138jodnmvtr0tp]
yandex_iam_service_account_static_access_key.sa-static-key: Creating...
yandex_resourcemanager_folder_iam_member.sa-editor: Creating...
yandex_iam_service_account_static_access_key.sa-static-key: Creation complete after 2s [id=aje2rtebkv20u4g6p9er]
yandex_storage_bucket.bucket-for-web-1: Creating...
yandex_resourcemanager_folder_iam_member.sa-editor: Creation complete after 2s [id=b1g73kf911qh20t72eeb/editor/serviceAccount:ajesqq138jodnmvtr0tp]
yandex_storage_bucket.bucket-for-web-1: Still creating... [10s elapsed]
yandex_storage_bucket.bucket-for-web-1: Creation complete after 14s [id=skillpropil-netology-bucket]
yandex_storage_object.error: Creating...
yandex_storage_object.index: Creating...
yandex_storage_object.error: Creation complete after 0s [id=error.html]
yandex_storage_object.index: Creation complete after 0s [id=index.html]

Apply complete! Resources: 7 added, 0 changed, 0 destroyed.

```
