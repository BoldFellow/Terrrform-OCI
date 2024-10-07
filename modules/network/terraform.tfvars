tenancy_id                          = "ocid1.tenancy.oc1..aaaaaaaa5dcnnsqjgsibydklvdq3o7e3zf5ms65cnckpm7edbczkmcs2kfoq"
compartment_id                      = "ocid1.compartment.oc1..aaaaaaaauukvqiuz52gzmrbf6r6sbqi6ova5auwcxzxkw4oaxs5d4nozbamq"
vcn_cidrs                           = ["10.10.0.0/16"]
vcn_name                            = "Main Israel VCN"
network_security_group_display_name = "Allow-All"
subnets = {
  public-sub1  = { name = "public-1", cidr_block = "10.10.1.0/24", type = "public" }
  public-sub2  = { name = "public-2", cidr_block = "10.10.3.0/24", type = "public" }
  private-sub1 = { name = "private-1", cidr_block = "10.10.2.0/24", type = "private" }
  private-sub2 = { name = "private-2", cidr_block = "10.10.4.0/24", type = "private" }
}
