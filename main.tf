provider "arvan" {
  api_key = var.ApiKey
}

module "server-rocky" {
  source       = "./modules/server-rocky"
  region       = var.region
  ApiKey       = var.ApiKey
  key_name     = arvan_iaas_sshkey.ssh-key-user-terraform.name
  server-count = var.server-count-rocky
}

module "server-ubuntu" {
  source       = "./modules/server-ubuntu"
  region       = var.region
  ApiKey       = var.ApiKey
  key_name     = arvan_iaas_sshkey.ssh-key-user-terraform.name
  server-count = var.server-count-ubuntu
}

module "server-debian" {
  source       = "./modules/server-debian"
  region       = var.region
  ApiKey       = var.ApiKey
  key_name     = arvan_iaas_sshkey.ssh-key-user-terraform.name
  server-count = var.server-count-debian
}

module "server-centos" {
  source       = "./modules/server-centos"
  region       = var.region
  ApiKey       = var.ApiKey
  key_name     = arvan_iaas_sshkey.ssh-key-user-terraform.name
  server-count = var.server-count-centos
}

resource "arvan_iaas_sshkey" "ssh-key-user-terraform" {
  region     = var.region
  name       = "ssh-key-user-terraform"
  public_key = var.public-key
}
