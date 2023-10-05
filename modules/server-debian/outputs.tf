output "abrak-details" {
  value = [
    arvan_iaas_abrak.abrak[*].id,
    arvan_iaas_abrak.abrak[*].name,
    arvan_iaas_abrak.abrak[*].region,
    arvan_iaas_abrak.abrak[*].addresses
  ]
}
