variable "vcn_name" {
  type        = string
  description = "name of the vcn"
}


variable "compartment_id" {
  type        = string
  description = "ID of the parent compartment"
}


variable "vcn_cidrs" {
  type        = list(string)
  description = "cidr blocks of vnc"
}


variable "network_security_group_display_name" {
  type        = string
  description = "Name of the network security group"
}


variable "subnets" {
  description = "Private or Public subnets in a VCN"
  type        = any
}

variable "tenancy_id" {
  description = "value of tenancy id"
  type        = string
}