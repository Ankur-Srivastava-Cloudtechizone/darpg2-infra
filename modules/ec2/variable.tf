variable "instances" {
  description = "Map of EC2 instance configurations"
  type = map(object({
    ami                         = string
    instance_type               = string
    subnet_name                 = string
    associate_public_ip_address = bool
    key_name                    = string
    sg_name                     = string
    tags                        = map(string)
  }))
}
