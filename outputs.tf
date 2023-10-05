output "details-abrak-rocky" {
  value = module.server-rocky.abrak-details
}

output "details-abrak-ubuntu" {
  value = module.server-ubuntu.abrak-details
}

output "details-abrak-debian" {
  value = module.server-debian.abrak-details
}

output "details-abrak-centos" {
  value = module.server-centos.abrak-details
}

output "details-ssh-key" {
  value = arvan_iaas_sshkey.ssh-key-user-terraform
}
