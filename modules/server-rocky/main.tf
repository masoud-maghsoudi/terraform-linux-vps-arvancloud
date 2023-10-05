provider "arvan" {
  api_key = var.ApiKey
}

locals {
  abrak-name = basename(abspath(path.module))
}

resource "arvan_iaas_abrak" "abrak" {
  number = var.server-count
  count  = var.server-count
  region = var.region
  flavor = var.image-flavor
  name   = "${local.abrak-name}-${count.index}"
  image {
    type = "distributions"
    name = var.image-name
  }
  key_name  = var.key_name
  disk_size = var.disk_size

}
