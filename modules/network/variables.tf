

variable "vcn_name" {  
    type = string
    description = "name of the vcn"
}    


variable "compartment_id" {
    type = string
    description = "id of the parent compartment"
}

variable "vcn_cidrs" {
    type = list(string)
    description = "cidr blocks of vnc"
}

variable "subnets" {
  description = "Private or Public subnets in a VCN"
  type        = any
  default     = {}
  
}