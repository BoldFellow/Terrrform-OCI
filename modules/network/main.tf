

module "vcn" {
  source  = "oracle-terraform-modules/vcn/oci"
  version = "3.6.0"
    compartment_id = var.compartment_id
    vcn_name = var.vcn_name
    create_internet_gateway = true
    vcn_cidrs = var.vcn_cidrs
}
