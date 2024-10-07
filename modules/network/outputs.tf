output "vcn_id" {
  description = "ID of vcn that is created"
  value       = module.vcn.vcn_id
}


output "subnets_ids" {
  description = "IDs of subnets that are created"
  value       = module.subnet.*.subnet_id
}


output "Public_NSG_id" {
  description = "ID of the public NSG"
  value       = oci_core_network_security_group.public_network_security_group.id
}


output "Publi_security_list_id" {
  description = "ID of public security list"
  value       = oci_core_security_list.public_security_list.id
}