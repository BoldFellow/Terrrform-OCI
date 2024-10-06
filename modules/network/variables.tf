

variable "vcn_name" {
  type        = string
  description = "name of the vcn"
}


variable "compartment_id" {
  type        = string
  description = "id of the parent compartment"
}

variable "vcn_cidrs" {
  type        = list(string)
  description = "cidr blocks of vnc"
}


variable "network_security_group_display_name" {
  type        = string
  description = "name of the network security group"

}
