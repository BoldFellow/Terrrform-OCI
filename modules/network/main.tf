module "vcn" {
  source = "oracle-terraform-modules/vcn/oci"

  compartment_id          = var.compartment_id
  vcn_name                = var.vcn_name
  create_internet_gateway = true
  vcn_cidrs               = var.vcn_cidrs
}


module "subnet" {
  source = "github.com/BoldFellow/terraform-oci-vcn//modules/subnet?ref=main"

  compartment_id    = var.compartment_id
  tenancy_id        = var.tenancy_id
  subnets           = var.subnets
  enable_ipv6       = false
  vcn_id            = module.vcn.vcn_id
  ig_route_id       = module.vcn.ig_route_id
  nat_route_id      = null
  security_list_ids = [oci_core_security_list.public_security_list.id]
  count             = length(var.subnets) > 0 ? 1 : 0
}


resource "oci_core_security_list" "public_security_list" {
  compartment_id = var.compartment_id
  vcn_id         = module.vcn.vcn_id
  display_name   = "allow-all-security-list"

  ingress_security_rules {
    protocol    = "all"
    source      = "0.0.0.0/0"
    description = "all traffic"
    stateless   = false
  }
}


resource "oci_core_network_security_group" "public_network_security_group" {
  compartment_id = var.compartment_id
  vcn_id         = module.vcn.vcn_id

  display_name = var.network_security_group_display_name
}


resource "oci_core_network_security_group_security_rule" "public_network_security_group_security_rule" {
  network_security_group_id = oci_core_network_security_group.public_network_security_group.id
  direction                 = "INGRESS"
  protocol                  = "all"

  source      = "0.0.0.0/0"
  source_type = "CIDR_BLOCK"
  stateless   = false
}




# resource "oci_core_subnet" "public_subnets" {
#   count                      = 2
#   cidr_block                 = cidrsubnet(var.vcn_cidrs[0], 8, (count.index * 2) + 1)
#   compartment_id             = var.compartment_id
#   vcn_id                     = module.vcn.vcn_id
#   display_name               = "public-subnet-${count.index + 1}"
#   prohibit_internet_ingress  = false
#   prohibit_public_ip_on_vnic = false
#   route_table_id             = module.vcn.ig_route_id
#   security_list_ids          = oci_core_security_list.public_security_list.*.id
# }


# resource "oci_core_subnet" "private_subnets" {
#   count                      = 2
#   cidr_block                 = cidrsubnet(var.vcn_cidrs[0], 8, (count.index * 2) + 2)
#   compartment_id             = var.compartment_id
#   vcn_id                     = module.vcn.vcn_id
#   display_name               = "private-subnet-${count.index + 1}"
#   prohibit_internet_ingress  = true
#   prohibit_public_ip_on_vnic = true
# }